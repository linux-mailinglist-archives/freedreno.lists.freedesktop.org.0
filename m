Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E501D41D1
	for <lists+freedreno@lfdr.de>; Fri, 15 May 2020 01:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55536E3B0;
	Thu, 14 May 2020 23:45:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346DD6E0C4
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 23:45:08 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x15so105135pfa.1
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 16:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TS6m3tA7iP1dUmXkdet+rM4d6JbY2zF/WsqwIammF8E=;
 b=YjE6uPBGNr4Xe2rTD6hCoXF0Vo9fHrPRc8MeseKVAqIDzm93Jk/d4QULhMOfJ8ilHN
 Zi+1iu5vNwfDcdCueh1FAVNZq4QKsfXe4HeVxZ3O4Sm3d4u9KQh5EYd4GWvVNH8cfzkT
 qmyscxwZ7Tq16XPqH5qqJR6toOuYAZyl+KBnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TS6m3tA7iP1dUmXkdet+rM4d6JbY2zF/WsqwIammF8E=;
 b=twVCGeO2spT0SufXt7o0VmhnGQTUoBICTBC6HyVHRkrdWWR2iVHxvC7V7rQ/+d421r
 Qow9GaLp8WzyOf5RXmno9kqJ5BVgDZ5n5JwuBPzjciBxCNajqIxBc7F+oCW2owkJx/RO
 LoX79Mr9lki1TPT4+q8bx6u6lsFdFds7Cvn3o+0p4i6N/3/SCiKw6i3rHSRvIKE7PK5T
 5Dy/jPnLuLyu+2TVRoWufACTEH93YEeynarow5CAhjyjpq6Lzuhh7bcSoGJCl7EuURa9
 0k06V4KCNIo2l4i2/qRK1QAB6HPJMfBofQ+xJrTD1jGHO8+3HqKp4NmMCIMyTxESvGTd
 WK8Q==
X-Gm-Message-State: AOAM531MHdKdSlh/yeakRHPn0X4cUBv+/lA76OaVLc3fLrHiH16LdV7P
 VrQ4RGTwqy4NDva+dFOYu3/hhjkFR8g=
X-Google-Smtp-Source: ABdhPJx4mHQv2BFmu1UqFEL0Rzavx5iPrdT2xRUY4noa8VccK+9T65lv35xK9Ign6IhTDiC7W+uE/Q==
X-Received: by 2002:a63:1845:: with SMTP id 5mr519761pgy.69.1589499907739;
 Thu, 14 May 2020 16:45:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id w84sm265543pfc.116.2020.05.14.16.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 16:45:07 -0700 (PDT)
Date: Thu, 14 May 2020 16:45:06 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200514234506.GS4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-3-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-3-git-send-email-smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 2/6] arm64: dts: qcom: sc7180: Add
 opp-peak-kBps to GPU opp
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 04:24:15PM +0530, Sharat Masetty wrote:

> Subject: arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp

nit: s/opp/OPPs/

>
> Add opp-peak-kBps bindings to the GPU opp table, listing the peak
> GPU -> DDR bandwidth requirement for each opp level. This will be
> used to scale the DDR bandwidth along with the GPU frequency dynamically.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 0ce9921..89f7767 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1392,36 +1392,43 @@
>  				opp-800000000 {
>  					opp-hz = /bits/ 64 <800000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <8532000>;
>  				};
> 
>  				opp-650000000 {
>  					opp-hz = /bits/ 64 <650000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-peak-kBps = <7216000>;
>  				};
> 
>  				opp-565000000 {
>  					opp-hz = /bits/ 64 <565000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <5412000>;
>  				};
> 
>  				opp-430000000 {
>  					opp-hz = /bits/ 64 <430000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <5412000>;

I suppose it's intentional that the bandwidth is the same as for opp-565000000,
just want to mention it for if it's a C&P error.


>  				};
> 
>  				opp-355000000 {
>  					opp-hz = /bits/ 64 <355000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <3072000>;
>  				};
> 
>  				opp-267000000 {
>  					opp-hz = /bits/ 64 <267000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <3072000>;
>  				};

ditto

>  				opp-180000000 {
>  					opp-hz = /bits/ 64 <180000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +					opp-peak-kBps = <1804000>;
>  				};
>  			};
>  		};

assuming the repeated bandwidths are indeed intentional:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
