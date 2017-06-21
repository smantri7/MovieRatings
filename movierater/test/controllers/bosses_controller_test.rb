require 'test_helper'

class BossesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boss = bosses(:one)
  end

  test "should get index" do
    get bosses_url
    assert_response :success
  end

  test "should get new" do
    get new_boss_url
    assert_response :success
  end

  test "should create boss" do
    assert_difference('Boss.count') do
      post bosses_url, params: { boss: { email: @boss.email, login: @boss.login, name: @boss.name } }
    end

    assert_redirected_to boss_url(Boss.last)
  end

  test "should show boss" do
    get boss_url(@boss)
    assert_response :success
  end

  test "should get edit" do
    get edit_boss_url(@boss)
    assert_response :success
  end

  test "should update boss" do
    patch boss_url(@boss), params: { boss: { email: @boss.email, login: @boss.login, name: @boss.name } }
    assert_redirected_to boss_url(@boss)
  end

  test "should destroy boss" do
    assert_difference('Boss.count', -1) do
      delete boss_url(@boss)
    end

    assert_redirected_to bosses_url
  end
end
