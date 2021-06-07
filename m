Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0064639EA27
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 01:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5092F6E442;
	Mon,  7 Jun 2021 23:31:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56916E442
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jun 2021 23:31:50 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so17435698otu.6
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jun 2021 16:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pYTvT9ubISsRaLeWVshLEwMcGZ3wwUzz5ZnXQAq/G5Q=;
 b=hZzVb3AlblV3JxW9qSZuCfP960vfYcWuKgRWH3bncsPDWCOejXYZ091GYK1SsVvu5g
 ru4/preWElYvWI6qTf3C5f6mF3hI0Tm9eL3d5/zk+96tSrWoAS2+6lTy24rzRzrJT8XR
 6hhfrdEf16V1ZVw+vjKiNwtYqntlBVwPbyB9fSsXQOQtEv7YY49NYodA3uUryk6TUTa5
 YpK0lgMwpZXYF3z4hqK2LcP/BL1x96fIVakOkPerSpNlHfYyAROKz05e9e6ZT4Yx5SNH
 xrbJBKTlCMdhUqiN0tirP1SvqPYyHSquSORt/6crQnlBuvfpA/redOIjhCo7v3Pur4HC
 9C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pYTvT9ubISsRaLeWVshLEwMcGZ3wwUzz5ZnXQAq/G5Q=;
 b=gqEFgfQAOIqSx3egLpUVUFTCE2mKZ1pi7teJSc0oEO+PjT8LtaUBlnsPKxMjsa2g3g
 cOldzuxARh8gOL1Yf/H2SEY/qfQVwHsGG5LpJ9Z69CR/+qLKbHO6zOMIxx1t8481Jvxw
 SkJtQP11KoHKhtD7NBPljJC6J0UIjJd3RFxPQhehZnkGziv4WTCUCW+UVxjkXZTQdyW2
 tizg6Wx+FY4/XH2+SD0lpiJ0u4Xr8Unzh44cj0tRK+9PBGp6DuHGCDMpnw+zfayGLUOf
 uMlGBtVh7vvcv4o6Y2e9EtJrmQizrVweElfPeNBsz0Fv7gDk/Uww0FXi+RkqJolUf0I4
 +AJw==
X-Gm-Message-State: AOAM530l9fZ4McAZ6dkLZJcxdo8Z+w+hgCV/2h1WJdkx8S7fYtcVTPyo
 HVoy94V8uneaOMsQvAYuXAYo5A==
X-Google-Smtp-Source: ABdhPJzYINdaU88ZN26yUyqgewxkKu3o9+qJRNCObFoRd1mEFTKoDvaEpnIK1T2HLIM/JP+kh+DtNQ==
X-Received: by 2002:a9d:5e8c:: with SMTP id f12mr15592500otl.18.1623108710244; 
 Mon, 07 Jun 2021 16:31:50 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 15sm2571809oij.26.2021.06.07.16.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 16:31:49 -0700 (PDT)
Date: Mon, 7 Jun 2021 18:31:47 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: khsieh@codeaurora.org, swboyd@chromium.org
Message-ID: <YL6sY/1E5wLzMiP/@yoga>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga>
 <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan>
 <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
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
 vkoul@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, agross@kernel.org, abhinavk@codeaurora.org,
 linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon 07 Jun 12:48 CDT 2021, khsieh@codeaurora.org wrote:

> On 2021-06-05 22:07, Bjorn Andersson wrote:
> > On Thu 03 Jun 16:56 CDT 2021, khsieh@codeaurora.org wrote:
> > 
> > > On 2021-06-03 09:53, Bjorn Andersson wrote:
> > > > On Thu 03 Jun 11:09 CDT 2021, Kuogee Hsieh wrote:
> > [..]
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > [..]
> > > > > +				power-domains = <&rpmhpd SC7180_CX>;
> > > >
> > > > Just curious, but isn't the DP block in the MDSS_GDCS? Or do we need to
> > > > mention CX here in order for the opp framework to apply required-opps
> > > > of CX?
> > > 
> > > yes,
> > 
> > If you want me, or other maintainers, to spend any time reviewing or
> > applying your patches going forward then you need to actually bother
> > replying properly to the questions asked.
> > 
> > Thanks,
> > Bjorn
> 
> Sorry about the confusion. What I meant is that even though DP controller is
> in the MDSS_GDSC
> power domain, DP PHY/PLL sources out of CX. The DP link clocks have a direct
> impact
> on the CX voltage corners. Therefore, we need to mention the CX power domain
> here. And, since
> we can associate only one OPP table with one device, we picked the DP link
> clock over other
> clocks.

Thank you, that's a much more useful answer.

Naturally I would think it would make more sense for the PHY/PLL driver
to ensure that CX is appropriately voted for then, but I think that
would result in it being the clock driver performing such vote and I'm
unsure how the opp table for that would look.

@Stephen, what do you say?

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
