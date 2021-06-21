Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA83AF846
	for <lists+freedreno@lfdr.de>; Tue, 22 Jun 2021 00:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EB06E435;
	Mon, 21 Jun 2021 22:09:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4694D6E435
 for <freedreno@lists.freedesktop.org>; Mon, 21 Jun 2021 22:09:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624313362; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GM3Rys8OFSz8Fjj+R4+f8pNnGNE62Jn04AMrGoksoas=;
 b=tFIbG5fRpN3c5W4ys7bQOwxBSXzJ9Qq8ICeN0I+u2q9K+Nn2rlsaTHnzkl3qBdTF/jUOfr9h
 b+ruboOFIIeo62UDVEhmv+osTkNF07x6/O6m5UWzIbH56pvfn5vxc3bcymwclhTa3oEFpc/o
 EmdFSLMDZWwAdbcS/0kZQxiaYeg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60d10e098491191eb3565173 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 22:09:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A77E5C43143; Mon, 21 Jun 2021 22:09:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AC8C8C43460;
 Mon, 21 Jun 2021 22:09:12 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 21 Jun 2021 15:09:12 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210515131217.1540412-5-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
 <20210515131217.1540412-5-dmitry.baryshkov@linaro.org>
Message-ID: <9ecc00ad01b8ae2390019b2674bff158@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 4/8] arm64: dts: qcom: sm8250: assign DSI
 clock source parents
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-05-15 06:12, Dmitry Baryshkov wrote:
> Assign DSI clock source parents to DSI PHY clocks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Can you please confirm if you have validated dual DSI with this change?
With that,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 947e1accae3a..b6ed94497e8a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2445,6 +2445,9 @@ dsi0: dsi@ae94000 {
>  					      "iface",
>  					      "bus";
> 
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc
> DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SM8250_MMCX>;
> 
> @@ -2512,6 +2515,9 @@ dsi1: dsi@ae96000 {
>  					      "iface",
>  					      "bus";
> 
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc
> DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SM8250_MMCX>;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
