Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB3839619F
	for <lists+freedreno@lfdr.de>; Mon, 31 May 2021 16:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5DD6E914;
	Mon, 31 May 2021 14:42:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77526E914
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 14:42:25 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so11281009oth.8
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 07:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qZo5Xl3B/iGBgaTUfAAHoJzK4eNGP09VMkA2WVAMmEA=;
 b=G+irpJZSuBkS7cMmsk66PyJ6PMjD7BPfmYzfGXwe2yjjAyO9YBKNHPmHBrfhZnEkKt
 teLlEfC3Hz6DZJ0P8+Ef+MdWamCQXdjA3qb+c1C9ca/mLXow0MJUrvoI/N9Z5Ed1XbQ5
 rfRFhTAmBXkGCYmKiBCXauu+zXzuYGoNgHKDDQsJWR4gZG4gRf9igb/Q2UDyr45Xly6I
 ZZ24zc+qc0AT6bIbshC6aHbkkncU4TDawmzDdnzGlrk00w3nG33LDl4pECinCR8xUPB7
 OIQsBUi2hzUC1KR6tcm6rxQCA6qdcBiiclUWPRstmH6XwyKVUPKgRfWLLPVhdKRwkoc5
 Z4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qZo5Xl3B/iGBgaTUfAAHoJzK4eNGP09VMkA2WVAMmEA=;
 b=D26ChZ0PQWcjQmfkl/fZqAWqWIOdAmzS+DxpgfsVgy3F+bLD5cQAY3c3jbHydylDoX
 dWiaK6Tfv2DilQb4Gq830VNG8W9fcpxLQBmCftTyFJgNPGnVtsP+UqxaSwtWDqhze67o
 vd1yRN+SILCQntk6oGDN/bj/cUqlhxG0wed1EnorYzRGF6rmE2EG2p23ebKG4g39CXd2
 sK1a+ySuAL9IfU0+bCGhkXaeIfkOj0xA5qRQLGz4VMADX27mAWOyLyA7hdgCdPAWmeuj
 nTvd0B0TUW1b0CIB0QOlPhgmoSiV04EEstNpSJogMFddq4Uw+YeEqazMYHxvDitrCm7X
 nddQ==
X-Gm-Message-State: AOAM533UGaYYuLCp1/rrGhHAOr320/LxRVTCykMNcc8GFSoPUnwyVbN2
 vCfoy10XGcf3NZkS7JlLTuVFnA==
X-Google-Smtp-Source: ABdhPJxKFWPIg9XMMPTnU9gnko2xdCi4qQvCCOI6yMaVDo812VQEIZywgAq5RhWPZ9HWgUtz/tIDaQ==
X-Received: by 2002:a9d:4d99:: with SMTP id u25mr4751897otk.248.1622472144886; 
 Mon, 31 May 2021 07:42:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id e83sm2803421oia.40.2021.05.31.07.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 07:42:24 -0700 (PDT)
Date: Mon, 31 May 2021 09:42:22 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YLT1ziKiesQHEw1B@builder.lan>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
 <20210407150157.801210-4-dmitry.baryshkov@linaro.org>
 <2dc79aad-33cd-7b17-368f-d52d60d46811@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2dc79aad-33cd-7b17-368f-d52d60d46811@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/4] arm64: dts: sdm845: move bus clock
 to mdp node for sdm845 target
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
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 28 May 10:33 CDT 2021, Dmitry Baryshkov wrote:

> On 07/04/2021 18:01, Dmitry Baryshkov wrote:
> > Move the bus clock to mdp device node,in order to facilitate bus band
> > width scaling on sdm845 target.
> > 
> > The parent device MDSS will not vote for bus bw, instead the vote will
> > be triggered by mdp device node. Since a minimum vote is required to
> > turn on bus clock, move the clock node to mdp device from where the
> > votes are requested.
> 
> drm/msm patches were merged through the msm tree (targeting 5.13). Shouldn't
> we also merge these two patches (targeting 5.13 as fixes or 5.14)?
> 

Does the vote for the bus clock result in an improvement or is the
device simply not working without it?

Regards,
Bjorn

> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 7395ef20b90e..55704804c2ca 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -4136,9 +4136,8 @@ mdss: mdss@ae00000 {
> >   			power-domains = <&dispcc MDSS_GDSC>;
> >   			clocks = <&gcc GCC_DISP_AHB_CLK>,
> > -				 <&gcc GCC_DISP_AXI_CLK>,
> >   				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > -			clock-names = "iface", "bus", "core";
> > +			clock-names = "iface", "core";
> >   			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> >   			assigned-clock-rates = <300000000>;
> > @@ -4166,11 +4165,12 @@ mdss_mdp: mdp@ae01000 {
> >   				      <0 0x0aeb0000 0 0x2008>;
> >   				reg-names = "mdp", "vbif";
> > -				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +				clocks = <&gcc GCC_DISP_AXI_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> >   					 <&dispcc DISP_CC_MDSS_AXI_CLK>,
> >   					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >   					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > -				clock-names = "iface", "bus", "core", "vsync";
> > +				clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
> >   				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >   						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > 
> 
> 
> -- 
> With best wishes
> Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
