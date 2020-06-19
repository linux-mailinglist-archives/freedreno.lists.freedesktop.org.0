Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B3201D5A
	for <lists+freedreno@lfdr.de>; Fri, 19 Jun 2020 23:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96456EBC0;
	Fri, 19 Jun 2020 21:55:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BCB6EBBA
 for <freedreno@lists.freedesktop.org>; Fri, 19 Jun 2020 21:55:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592603714; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wam1wyE1W3Of+tegUUPP3NeNpIntvTygPj4lrZBjm+o=;
 b=WYdV263OykUur5AUG4Cs1r11i8DKwSgDXSSNQb03UYZ42PpJtN0E3xq47hEHT24nnzYF99Yc
 1BDJlC/acxTpHVXfkkvbRlfAQOMh6e2eD0ATvsBD2OLI1dXJHTdACZS8aUoapnq0Xxo4mdT2
 3lyn1RASlVMcLub82/kfA+dDNoE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5eed343dad153efa34c33808 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Jun 2020 21:55:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 59C22C4339C; Fri, 19 Jun 2020 21:55:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C819C433CA;
 Fri, 19 Jun 2020 21:55:08 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 19 Jun 2020 14:55:08 -0700
From: tanmay@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
References: <20200618232113.22687-1-tanmay@codeaurora.org>
 <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
Message-ID: <c110cd89a3144a20b21ec392f50eee68@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v2] arm64: dts: qcom: sc7180: Add Display
 Port dt node
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
Cc: devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robdclark@gmail.com,
 agross@kernel.org, seanpaul@chromium.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Thanks Stephen for reviews.
I will post new change addressing your all comments.

On 2020-06-18 18:12, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-06-18 16:21:13)
>> Enable DP driver for sc7180.
> 
> Add DP device node on sc7180? This isn't a driver.
> 
Done.
>> 
>> This change depends-on following series:
>> https://patchwork.freedesktop.org/series/78583/
>> and https://patchwork.freedesktop.org/patch/351990/
>> 
>> Changes in v2:
>> 
>> - Add assigned-clocks and assigned-clock-parents
>> - Remove cell-index and pixel_rcg
>> - Change compatible to qcom,sc7180-dp
>> 
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 
>> ++++++++++++++++++++++++++--
>>  1 file changed, 53 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 916401f7e87c..26fe623e3b0f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -2216,10 +2216,19 @@ ports {
>>                                         #address-cells = <1>;
>>                                         #size-cells = <0>;
>> 
>> +                                       port@1 {
>> +                                               reg = <1>;
>> +                                               dpu_intf1_out: 
>> endpoint {
>> +                                                       
>> remote-endpoint =
>> +                                                                
>> <&dsi0_in>;
>> +                                               };
>> +                                       };
>> +
>>                                         port@0 {
>>                                                 reg = <0>;
>> -                                               dpu_intf1_out: 
>> endpoint {
>> -                                                       
>> remote-endpoint = <&dsi0_in>;
>> +                                               dpu_intf0_out: 
>> endpoint {
>> +                                                       
>> remote-endpoint =
>> +                                                                
>> <&dp_in>;
>>                                                 };
>>                                         };
>>                                 };
> 
> I thought this wasn't supposed to change? At least according to the
> binding it shouldn't be needed.
> 
Thanks. Yes it should be port@2 as per new dpu-sc7180.yaml bindings in 
below patch.
https://patchwork.freedesktop.org/patch/371087/?series=78583&rev=1

>> @@ -2293,6 +2302,46 @@ dsi_phy: dsi-phy@ae94400 {
>>                         };
>>                 };
>> 
>> +               msm_dp: displayport-controller@ae90000{
>> +                       status = "ok";
> 
> Please use status = "disabled";
> 
Ok got it. Board's DT will enable it.

>> +                       compatible = "qcom,sc7180-dp";
>> +
>> +                       reg = <0 0xae90000 0 0x1400>;
>> +                       reg-names = "dp_controller";
>> +
>> +                       interrupt-parent = <&mdss>;
> 
> Any reason why this isn't under the mdss node like the other display
> device nodes?
> 
Done. Moved msm_dp node under mdss.
>> +                       interrupts = <12 0>;
>> +
>> +                       clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +                                <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +                                <&dispcc 
>> DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +                       clock-names = "core_aux", "ctrl_link",
>> +                                     "ctrl_link_iface", 
>> "stream_pixel";
>> +                       #clock-cells = <1>;
>> +                       assigned-clocks = <&dispcc 
>> DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +                       assigned-clock-parents = <&msm_dp 1>;
>> +
>> +                       data-lanes = <0 1>;
> 
> This can and should be left to the board files. At the SoC level my
> understanding is that there are four lanes possible, so no need to
> artificially limit it here.
> 
Removed from here. Driver changes I will be posting accordingly.
>> +
>> +                       ports {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               port@0 {
>> +                                       reg = <0>;
>> +                                       dp_in: endpoint {
>> +                                               remote-endpoint =
>> +                                                        
>> <&dpu_intf0_out>;
> 
> I'd prefer these were on one line, regardless of the 80 character line
> limit/suggestion.
> 
ok done.
>> +                                       };
>> +                               };
>> +
>> +                               port@1 {
>> +                                       reg = <1>;
>> +                                       dp_out: endpoint { };
>> +                               };
>> +                       };
>> +               };
>> +
>>                 dispcc: clock-controller@af00000 {
>>                         compatible = "qcom,sc7180-dispcc";
>>                         reg = <0 0x0af00000 0 0x200000>;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
