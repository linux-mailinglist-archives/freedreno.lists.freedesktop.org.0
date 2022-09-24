Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D65E8D7A
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 16:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22F210E3AE;
	Sat, 24 Sep 2022 14:47:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117BC10E051
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 14:47:22 +0000 (UTC)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl
 [95.49.29.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5178A1F8F0;
 Sat, 24 Sep 2022 16:47:17 +0200 (CEST)
Message-ID: <83658ff9-5fc1-c9bc-9c21-98d7e08d534c@somainline.org>
Date: Sat, 24 Sep 2022 16:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 24.09.2022 11:00, Dmitry Baryshkov wrote:
> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
> them with generic phy@ names.
> 
> Dmitry Baryshkov (9):
>   ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>   ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8916: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8996: change DSI PHY node name to generic one
>   arm64: dts: qcom: sc7180: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm630: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm660: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm845: change DSI PHY node name to generic one
>   arm64: dts: qcom: sm8250: change DSI PHY node name to generic one
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

for the entire series

Konrad
> 
>  arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 2 +-
>  arch/arm/boot/dts/qcom-apq8064.dtsi                | 2 +-
>  arch/arm/boot/dts/qcom-msm8974.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi              | 2 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 4 ++--
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sdm660.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 4 ++--
>  10 files changed, 13 insertions(+), 13 deletions(-)
> 
