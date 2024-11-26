Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74AE9D9720
	for <lists+freedreno@lfdr.de>; Tue, 26 Nov 2024 13:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A2A10E1AB;
	Tue, 26 Nov 2024 12:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dRlevlLB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F78010E3F0
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 12:17:58 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53dee064f00so534822e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 04:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732623476; x=1733228276; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zIiJZ55i8NdMGDjfrOdk3DfZs/tLxD9oconoLO+oq+A=;
 b=dRlevlLBBNBXUBf2Bx/Os3BDeap5tilDAh7Tk3tGWwyybeaVRJe2Gl3L7g9cBJWPVq
 Edf6HcPP1WEQxg/NxxkkPC1gOYKHkvu6cof3ixTRnoi0LhjA/COcPmyJ8ccwtPkqrMwa
 Io0S/YcFuif4ZKuQl0l1UXEWG4ZpM93b8iPu2tP30QPPTEabEwxqclnw4yG36rCmD/Mh
 fctv00NF0ql/SlPDBvnRtvhbTdjyybCqEUoIyu6YE6KauPdfoYomayB1haHM8mnZDiTF
 lFi5xUPZl7kASTDVUmk0sllo9e/wHn/K9kNPXqhS6rjkagGIbI22kHvRgeEyqGTUYU/l
 33HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732623476; x=1733228276;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIiJZ55i8NdMGDjfrOdk3DfZs/tLxD9oconoLO+oq+A=;
 b=KRjdujsmPnZwhTgvV8chqEt3cZf1PP3BODVD3IVTYvrFEMCw44ukP6CN9xdZyTcO0E
 iH594mR3R0JkLzVTgTbCXCSNyCk6+69efgD+9+4L08XlrK0XZZNck2aaKDlYh5Zsxev9
 iRsuDj6fp/5+OsZoL1doXEvkXWqH1Yek0lhJxsy+vmPmuLvnzSvRrFeNGHRYLnoL/v2t
 XcbtNbvBD2fZooAuO0fYRZ6NWEic16/6IUBGZYt16DF+ztvEtCQku8ZAhX0cBZEbnkwW
 X/CcL0cfPEq3xNQp/e6syjZKFuHuvCbA5O9CtC/Cv2JQGJeXg0P0O1L7YOlQ+dxKQ4iB
 5+Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfV4/fJ5XfPab/5H4adY9ZI3Jeq/qKMcNxNczaPeNLeEErXD7rxHmgWfXZT76dh1YSth82Ib/r+YE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL7nWo0doEKKlaVwb1bi7QfIlH4SRB0HcHwbWSnrwHiOcpVQuz
 N6e5XA4dZJ/1ekZdeKQtTf7X66SDtXGKg3W7E8iazpL6/faAQlHMd+HwzT6kuuU=
X-Gm-Gg: ASbGncvxuChFI0zFberd/z6T5LjWUDHAD4bPoobCYxsSuE+aw9o5oWTr3q+EJXylJyT
 L2w0p40sXZjE9Tw/pjbGk+wCoVTZjHLJrVy76T3ov2MtvgnnnxY+4hyQ5kH3AHB2OIZ0umZ+vWM
 6xf3xMRq+DBHgFubDMOFeSFdUqa10Hv/2YDEFcl2hekeEMqLlqwzX+DvI5tQg5ffmM2Ipb+7bg6
 UuONnIs/eF+gupmvSbvVAEyAuFQZAIWv5eeOHWCT/w5UdiW9dG6Q/JjYzceqh1ucR2pZKNmz4CT
 22tuUqi8HzX6ba1CjajGfeg8sg21sg==
X-Google-Smtp-Source: AGHT+IGNnMnzJzSH4csFVqMWLKW+PYj2pG4i5xQYfHjEXv1hvwV2rJVchkFPFu5thqmIhO3VCJ0s5A==
X-Received: by 2002:a05:6512:3c84:b0:53b:1526:3a63 with SMTP id
 2adb3069b0e04-53dd39b564bmr7770105e87.56.1732623475913; 
 Tue, 26 Nov 2024 04:17:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd68c64c7sm1790045e87.114.2024.11.26.04.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 04:17:54 -0800 (PST)
Date: Tue, 26 Nov 2024 14:17:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Connor Abbott <cwabbott0@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/msm/mdss: define bitfields for the
 UBWC_STATIC register
Message-ID: <bclvvuo3i4icx5kraqsvmpdtokx46pnjmdhliz2mhsmdm256vm@rbkwhkhjvjtc>
References: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
 <20241123-msm-mdss-ubwc-v2-1-41344bc6ef9c@linaro.org>
 <784a7813-b024-452e-8d7e-8cbaea761bcd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <784a7813-b024-452e-8d7e-8cbaea761bcd@quicinc.com>
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

On Mon, Nov 25, 2024 at 06:03:52PM -0800, Abhinav Kumar wrote:
> 
> 
> On 11/22/2024 9:44 PM, Dmitry Baryshkov wrote:
> > Rather than hand-coding UBWC_STATIC value calculation, define
> > corresponding bitfields and use them to setup the register value.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c                 | 38 +++++++++++++++-----------
> >   drivers/gpu/drm/msm/msm_mdss.h                 |  3 +-
> >   drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++++++-
> >   3 files changed, 34 insertions(+), 18 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
> > index ac85caf1575c7908bcf68f0249da38dccf4f07b6..b6f93984928522a35a782cbad9de006eac225725 100644
> > --- a/drivers/gpu/drm/msm/registers/display/mdss.xml
> > +++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
> > @@ -21,7 +21,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
> >   	<reg32 offset="0x00058" name="UBWC_DEC_HW_VERSION"/>
> > -	<reg32 offset="0x00144" name="UBWC_STATIC"/>
> > +	<reg32 offset="0x00144" name="UBWC_STATIC">
> > +		<bitfield name="UBWC_SWIZZLE" low="0" high="2"/>
> > +		<bitfield name="UBWC_BANK_SPREAD" pos="3"/>
> > +		<!-- high=5 for UBWC < 4.0 -->
> > +		<bitfield name="HIGHEST_BANK_BIT" low="4" high="6"/>
> > +		<bitfield name="UBWC_MIN_ACC_LEN" pos="8"/>
> 
> MIN_ACC_LEN OR MALSIZE has 2 bits , bits 8 and 9.
> 
> But bit 9 is unused today. Hence we were using it as a 1 or 0 today.
> 
> Its unused on all the chipsets I checked. Do you want to continue using the
> same way or correct this?

Let's correct it. I will send next iteration.

-- 
With best wishes
Dmitry
