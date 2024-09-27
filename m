Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C58988094
	for <lists+freedreno@lfdr.de>; Fri, 27 Sep 2024 10:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D03F10EC7D;
	Fri, 27 Sep 2024 08:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qmMT+Orc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CDA10EC7C
 for <freedreno@lists.freedesktop.org>; Fri, 27 Sep 2024 08:42:20 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53653ff0251so2341899e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 27 Sep 2024 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727426538; x=1728031338; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wORqZqv9cUGC80DSKYgE6tfqrN9lDUHFj2CIW1jLYmc=;
 b=qmMT+OrcdMgpQQ2yE3BpK/TAkn3H5ndqD6AqsuUn2uprYCJJTo2SyF3zLlt5q7QZpr
 WRpmGtAvrPWkBvK44txwSPspDRN8C4dGl4TQPm/bIt0HrSl2NeiKeBiv+SnwKCYU+guP
 AqKto4d9pOQWZKF31LRbIcjUIy6SRn5NjcseXPphPg23XqeuBAc3LYDpAjRbZbwYls4j
 TN1/Di3ppnNILU7HL03HobYznzKzj2w9Foeri+6jPX2AyWJIjTvwcpCx94lF4fuQoITV
 JwPv+fyioIcfVG/KpYHlE3/QPFAKbLwsimSaHyESStcdPboA5WJmXpDTuHzeiuYrPah3
 HzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727426538; x=1728031338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wORqZqv9cUGC80DSKYgE6tfqrN9lDUHFj2CIW1jLYmc=;
 b=g3uSGnNEJDsVmKBBUqYohfryvqfiPuwk71tAK/Qq1AIc2+GDZcOG+Jyt9Z4yaja865
 M1Qz7WeMnpHBBoLgMyczoc2i7tn7En2aa3itSPGUvM9+VO3QT1bfvW8ema8qK7zMoe38
 XfLfn/VGLbKJTwenl6T7DV1xTGNNBFeMojDjW00crlzT/vxsM4BTvjvyLtqvXxdKakuH
 I9EsxvTJmHfW3BO6jRBNOXMBtfsS/azBNKC4FoWgm5z76qq/VuKS/YIWdqvGXT7XWjat
 qxJ/Q4iF07VXRxE+Ku0VoLx5oVcxEuiVB+UikGPXDTNDkz8c2+Ae/V4Va6OlBFJv2mmD
 U8JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlNd90x0Jsqtz1g+EnzYAk6CBcVc6o3EK+6DTghUHZxf3g+uL7hOBwZy6PD8Vf99TOtyTN63RFH6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjvXRB4k2TDEjpdlR4xXm+PX6QhHMJwFC3P2qzrhCY0KRvotwt
 8/SLNjphgBYFutCla2B+2ozZVDp7j2Sl+8cN7ZpduTrukrDudElzdR9E7Y2vEgw=
X-Google-Smtp-Source: AGHT+IGKld9rtmGQC3DBnDTbpXbiuKQNjTBpR+lYTXMLGlZV+jtXEFJDHRP8wtIhf6Y6NwwWQqYIMg==
X-Received: by 2002:a05:6512:3052:b0:52e:941d:7039 with SMTP id
 2adb3069b0e04-5389fc70ef7mr1616146e87.59.1727426538329; 
 Fri, 27 Sep 2024 01:42:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5389fd54752sm226998e87.19.2024.09.27.01.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 01:42:17 -0700 (PDT)
Date: Fri, 27 Sep 2024 11:42:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH v2 3/5] drm/msm: mdss: Add SA8775P support
Message-ID: <lpxx7xa4j2ghsj4klcbmribpvl3dzksy6zblbdo4zt2huarzmv@zz4yomzsdwli>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-4-quic_mahap@quicinc.com>
 <35e6yleiy6wkja3ojlfjddifxv7kr7x6tyn5pszas2chouuvql@trpeb7b4eop2>
 <2414cba4-53f2-4aec-b87b-9f8d92035bad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2414cba4-53f2-4aec-b87b-9f8d92035bad@quicinc.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Sep 27, 2024 at 12:14:16PM GMT, Mahadevan P wrote:
> 
> On 9/26/2024 6:32 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 26, 2024 at 04:31:35PM GMT, Mahadevan wrote:
> > > Add Mobile Display Subsystem (MDSS) support for the SA8775P platform.
> > > 
> > > Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> > > ---
> > > 
> > > [v2]
> > > - Update commit message. [Dmitry]
> > > - Reorder compatible string of MDSS based on alphabetical order. [Dmitry]
> > > - add reg_bus_bw in msm_mdss_data. [Dmitry]
> > > 
> > > ---
> > >   drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > > index faa88fd6eb4d..8f1d42a43bd0 100644
> > > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > > @@ -573,6 +573,16 @@ static const struct msm_mdss_data qcm2290_data = {
> > >   	.reg_bus_bw = 76800,
> > >   };
> > > +static const struct msm_mdss_data sa8775p_data = {
> > > +	.ubwc_enc_version = UBWC_4_0,
> > > +	.ubwc_dec_version = UBWC_4_0,
> > Just 4.0 or 4.3?
> 
> 
> UBWC version has to be 4.0 as per UBWC reference document of sa8775p.

Thanks for the confirmation.

-- 
With best wishes
Dmitry
