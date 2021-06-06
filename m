Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1144B39CD60
	for <lists+freedreno@lfdr.de>; Sun,  6 Jun 2021 07:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512256E514;
	Sun,  6 Jun 2021 05:07:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931556E514
 for <freedreno@lists.freedesktop.org>; Sun,  6 Jun 2021 05:07:12 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v22so14506914oic.2
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jun 2021 22:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yS6q0T3N9afYQN5HdfWE5z7pv3ReU18X80dOdXsawn0=;
 b=F2tuo+vePIjuZq6maCAptHCP9qgP3Apo2dhGkToFBYsgQdS2L6KJYf4SOxlHZjH2q3
 EZ3tuCclRrjKH1U+Q8NXEqvjUwcKpxhUOhlP4Ocs5B8IwJwNKBJnPWswJTXxLPh2Rns0
 ahKPWlSSOGkau6mcxd86A91vqGNXDSRwgWCuhlS7UZJLhpeuwJt8OyLa8GREd4p3Efrg
 scPUoR8t+/KNb/DMHoL1gVHTkMrQlVzE+KhkPPvMmQa7W70sa3W2fFiCXGiJ30oT9SYm
 9pnWP5wM1ur9GWhqelEhR4TcHMr6Gz2FUnMjHk6Yyq9E6FptvVK1nmQIi70zdgjQCu2q
 qc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yS6q0T3N9afYQN5HdfWE5z7pv3ReU18X80dOdXsawn0=;
 b=OWk9zUFh0BaphGn3sxKwXKr0LFQ0MGY2IyYOkg7Q7z0PIMnRYqEBAorrEERO9+6rJf
 dz1cdr1FjvPrnK6L640/+L5bLQH0ijt70bSUcXG5lD/Gc1q3WuBsbtS8FlqUXNLrUCFI
 X/D5Z+K+X6nRh04Mhwd7y6PfSKjuO1Ci5Q4XCpF33vR5yUhnHQQ3aLURttpuQ7utB9DL
 RnqGo7W8jC1dCuGNUf7CrjUKorRZIJ6iyeC4tvo3sAsfCLUa1c4inUsegjneyVluYQE6
 hXQ/Hj2WO9ogjMzLjtn+a5IBI/Ud56mnPOAd6w9E0ljjIF71FtPuZfaNxtRPtL2owuzx
 cTdg==
X-Gm-Message-State: AOAM532pWgd7PzyjfaHiYSGIOv3Nt7kga0dy7B5mUePVk1jQ2zhuhCno
 lvw0oJPbt/oqnmz3GJhCoMC5YQ==
X-Google-Smtp-Source: ABdhPJxq+wFGA2yHIm0XUjuXzAIZpsyd09ngggNZe3/Va1Pg+/uWCcOXkmOOvCcKNZfj57WIIzO/AA==
X-Received: by 2002:a54:4e82:: with SMTP id c2mr15961103oiy.137.1622956031734; 
 Sat, 05 Jun 2021 22:07:11 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 123sm555226ooe.24.2021.06.05.22.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jun 2021 22:07:11 -0700 (PDT)
Date: Sun, 6 Jun 2021 00:07:09 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: khsieh@codeaurora.org
Message-ID: <YLxX/YtegtbLmkri@builder.lan>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga>
 <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port
 dt node
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 03 Jun 16:56 CDT 2021, khsieh@codeaurora.org wrote:

> On 2021-06-03 09:53, Bjorn Andersson wrote:
> > On Thu 03 Jun 11:09 CDT 2021, Kuogee Hsieh wrote:
[..]
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
[..]
> > > +				power-domains = <&rpmhpd SC7180_CX>;
> > 
> > Just curious, but isn't the DP block in the MDSS_GDCS? Or do we need to
> > mention CX here in order for the opp framework to apply required-opps
> > of CX?
> 
> yes,

If you want me, or other maintainers, to spend any time reviewing or
applying your patches going forward then you need to actually bother
replying properly to the questions asked.

Thanks,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
