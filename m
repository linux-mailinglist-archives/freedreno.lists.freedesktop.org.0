Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD738EBEB
	for <lists+freedreno@lfdr.de>; Mon, 24 May 2021 17:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C9889A9A;
	Mon, 24 May 2021 15:08:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4998918E
 for <freedreno@lists.freedesktop.org>; Mon, 24 May 2021 15:08:18 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id b25so27396443oic.0
 for <freedreno@lists.freedesktop.org>; Mon, 24 May 2021 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qd2GGNOqjcoVwR9/InTy3gHaTefuQ8PzIzZm4PfwF+Q=;
 b=pHUsCN/IDaId/ipsKoG3ZrMYVpOUrGYrLef0xTZtQqyz5XEMvN+lSpLTWg7jqjs6Jg
 8wJ0pQL7+XaAsnBMSaWQCy7vQ/ZJnhOkVL0wp8RSeBJ7P47eTtE07yeR4+A6SNbbViAa
 iet9G/GM1FfaXkBxAschybOUCLj4dh8QNh+vYyRua3BmM2eulhIfr9X1rl0wIRCwsWd+
 pISDWphupk3cSrSJvfwLRLkVetuRq3bdIaT1ju8SB684mx/GMUIuCsIkN5+XbviAupjL
 9P0mdNOzaKLEQ+SZt9yQ2d8SL3naZn+5M6s/xOz5hGkwU900zBI4ruNo/Nh5jzk7aRTk
 Bqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qd2GGNOqjcoVwR9/InTy3gHaTefuQ8PzIzZm4PfwF+Q=;
 b=fmYYQrM5+X3VF33tVN0M81vUDvqVX6l60szVzUs4aRZZ4j9A8O+UN20/fUVWXlpOFe
 +jYVQKyajLiH/l+VqEFBwQ0GnVyuWEDKu6b7R0cn12Th5EcrdNwiqJjLfSQvl8mSF7F1
 rU6X1DmWU5YK+4XF8XfO7Kbx/3sXFjC42XnT4A5yUJUnwdLQXTUMvJwP8HD89rexbqam
 rIzrpsJIKONCB26/UKpn0smkHzCfYgIaoZMbR32CZdEOXreGlM5SDfILf8mv4aVL63rM
 1Kyf2IoxHsKbgEhx1cV4/Efv+TJhfGqDyF024hBHGJeDuTYQGOTnHsIYJYJci4eRN5xm
 eJAA==
X-Gm-Message-State: AOAM530i0optBd8eQ9LDT9x8Lbo3LKBzUaebzDdaSgeFwxNF7Zcr9jaL
 Qo3zNJN6PDjXYspUJz4vquZ4lA==
X-Google-Smtp-Source: ABdhPJzQwEXxT63vulS4Mr1iXuUiQVfsntslWby9WpFJQ1i6LL+g6rwKWyZorlvtptAuR0hvccJ5Xg==
X-Received: by 2002:aca:230e:: with SMTP id e14mr11102837oie.58.1621868898078; 
 Mon, 24 May 2021 08:08:18 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id n11sm2564001oom.1.2021.05.24.08.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 08:08:17 -0700 (PDT)
Date: Mon, 24 May 2021 10:08:15 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20210524150815.GH2484@yoga>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-3-vkoul@kernel.org>
 <20210521144237.GZ2484@yoga> <YKtWM+BYeIA+P+55@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKtWM+BYeIA+P+55@vkoul-mobl.Dlink>
Subject: Re: [Freedreno] [RFC PATCH 02/13] dt-bindings: msm/dsi: Document
 Display Stream Compression (DSC) parameters
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon 24 May 02:30 CDT 2021, Vinod Koul wrote:

> On 21-05-21, 09:42, Bjorn Andersson wrote:
> > On Fri 21 May 07:49 CDT 2021, Vinod Koul wrote:
> > 
> > > DSC enables streams to be compressed before we send to panel. This
> > > requires DSC enabled encoder and a panel to be present. So we add this
> > > information in board DTS and find if DSC can be enabled and the
> > > parameters required to configure DSC are added to binding document along
> > > with example
> > > 
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > > index b9a64d3ff184..83d2fb92267e 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> > > +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > > @@ -48,6 +48,13 @@ Optional properties:
> > >  - pinctrl-n: the "sleep" pinctrl state
> > >  - ports: contains DSI controller input and output ports as children, each
> > >    containing one endpoint subnode.
> > > +- qcom,mdss-dsc-enabled: Display Stream Compression (DSC) is enabled
> > > +- qcom,mdss-slice-height: DSC slice height in pixels
> > > +- qcom,mdss-slice-width: DSC slice width in pixels
> > > +- qcom,mdss-slice-per-pkt: DSC slices per packet
> > > +- qcom,mdss-bit-per-component: DSC bits per component
> > > +- qcom,mdss-bit-per-pixel: DSC bits per pixel
> > > +- qcom,mdss-block-prediction-enable: Block prediction mode of DSC enabled
> > >  
> > >    DSI Endpoint properties:
> > >    - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> > > @@ -188,6 +195,14 @@ Example:
> > >  		qcom,master-dsi;
> > >  		qcom,sync-dual-dsi;
> > >  
> > > +		qcom,mdss-dsc-enabled;
> > 
> > To me the activation of DSC seems to be a property of the panel.
> 
> I think there are three parts to the problem
> 1. Panel needs to support it

In the case of DP there's bits to be read in the panel to figure this
out, for DSI panels this seems like a property that the panel (driver)
should know about.

> 2. Host needs to support it

Right, so this needs to be known by the driver. My suggestion is that we
derive it from the compatible or from the HW version.

> 3. Someone needs to decide to use when both the above conditions are
> met.
> 
> There are cases where above 1, 2 will be satisfied, but we might be okay
> without DSC too.. so how to decide when to do DSC :)
> 

Can we describe those cases? E.g. is it because enabling DSC would not
cause a reduction in clock speed that's worth the effort? Or do we only
use DSC for DSI when it allows us to squeeze everything into a single
link?

Regards,
Bjorn

> I feel it is more of a system property. And I also think that these
> parameters here are host configuration and not really for panel...
> 
> > 
> > > +		qcom,mdss-slice-height = <16>;
> > > +		qcom,mdss-slice-width = <540>;
> > > +		qcom,mdss-slice-per-pkt = <1>;
> > > +		qcom,mdss-bit-per-component = <8>;
> > > +		qcom,mdss-bit-per-pixel = <8>;
> > > +		qcom,mdss-block-prediction-enable;
> > 
> > Which of these properties relates to the DSC encoder and what needs to
> > be agreed with the sink? Can't we derive e.g. bpp from the information
> > we have from the attached panel already?
> 
> Let me go back and check on this a bit more
> 
> Thanks
> -- 
> ~Vinod
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
