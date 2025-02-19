Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F9A3CBF1
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 23:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F8E10E077;
	Wed, 19 Feb 2025 22:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vnmEqdvj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4A310E08A
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 22:02:23 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30a317e4c27so2189051fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740002542; x=1740607342; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oXHpN0DWqjhN0hLE65VSAtbnzicm1GUQhBz/HJwZ43M=;
 b=vnmEqdvj3qjX7bMV1z5hhsjZMl16M/jqk6Nm30LBavKaYS5sowXFP0YJ3sN0iwGJo7
 fxT1iev63+otYv15XjX32HdvGFDOtucmLQAUk+Luom34VTHYZsogP0GiV+62RUZiWzst
 PrWdFdRoFXtyVkNIji0hjPrpwHR2ilbVZwpkB8xGKQGt1Wht4POSt4q2cUJsX+zm/M7G
 nB6KcFiTsnWCRxX3Qwc8nUNmP8wSunDQp3U+z8hwd5vWV5IoWGx9HZTkLCvrpPK80S56
 gxU2Dz5yX6qK6MZUTIcsxOYPebsO4bAPlJb3qmzsZ73FH7OoKFqmISAIsex1CPm6UuPz
 qjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740002542; x=1740607342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oXHpN0DWqjhN0hLE65VSAtbnzicm1GUQhBz/HJwZ43M=;
 b=jBRYSryvwafe09EP2wAR73tYt8m9DTIoCJ1T0T2uvKRSlyXyApHlJ0hHgyte9zRlSq
 rhcdcOOPziqhu4UP7TbPKPx3+lu4sg/WNsUmVf1MaR5LJG6jzbNb8/Y1cikNbI9c/el4
 NgX3Lhdz29UScJiFVCet1b1Ekd3AtEq8o6TDGWlf2k5xHbA7ggxmU5/asAP4gmS6VEhB
 NEbzMnRO9QolJPZQkyvoD3HBdzK3JLoeeD2kv56DwXmOe7AOH0k0zOJr1rR+VtYqKSVk
 hMC6NGfgLsR2YfYd2vc84q3WocLHOUh2t0MCIjbBFbPGfh80ApGYc3iFF8ouiLHgSsyq
 9gJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8rdRE8fMG1MsdMGzjzUE8HSQjyUaxr4EXDoX8HKvPU0ii5/XG+l1d5yXFwolvsONDXqKXmFchask=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWNcUDwrCQULQscHQPLLRAjB2ESKcTF1/tatrlDHGsT5UPP9nH
 NhQT5zEnXxqENw+YRICkf5U1VxIMiY94go74HJqqwI2NNEiGmPwlvWNKUfcOCYs=
X-Gm-Gg: ASbGncszhvVcnuu3bUhwAO30zao7kz4qZ3KA452irt9lEwUdwMNbaeFNy/rz/BiCk7n
 FaqqNukT4y7rO1QNLf6IWPj21COqKtrjNt1wCHGR4hRtkDRkFKzU+uL2+UMIJkuLaku+VLXxAKw
 mZdRFPZpJl20pf38RgOTpZHudZrf+xPjm1cna2ts3QioVALN/tpC+IZsrhvNSJyA6fB/OeNMT6j
 e8pBNfbWhItaMHlrajIhF9NzVrfIMv4UlwQzT0Xb+GFo7HxrjEUALy4D/vNopLB45cizwzQJ1p8
 doCoRUzKTB7NBXpQ4zhevOuDxv7rK3WrwLm/v6iGD3BRu8few8fIUxwQfY3msOEpd9zLjKo=
X-Google-Smtp-Source: AGHT+IH3qwpCZJIIRtXoLdJAC5M4Yj195wVlXHneaiHgEATwNAfneT8LPoyDLjdolhf1GGkQ1/U9CQ==
X-Received: by 2002:a2e:a302:0:b0:304:d8e7:7ea1 with SMTP id
 38308e7fff4ca-30927ad5151mr58261401fa.23.1740002541724; 
 Wed, 19 Feb 2025 14:02:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a2b50c78esm13466611fa.74.2025.02.19.14.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 14:02:20 -0800 (PST)
Date: Thu, 20 Feb 2025 00:02:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Herring <robh@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 00/16] drm/msm: Add support for SM8750
Message-ID: <h6rm4zlj2xoqp6ze34cwu6y5xxx423l7lrdrbkezp7ct5pwms2@jmrlxr6hyhb7>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <eedf08c5-d781-45c8-a5f7-b0369e3efac9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eedf08c5-d781-45c8-a5f7-b0369e3efac9@quicinc.com>
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

On Wed, Feb 19, 2025 at 01:17:35PM -0800, Jessica Zhang wrote:
> 
> 
> On 2/17/2025 8:41 AM, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > Dependency / Rabased on top of:
> > https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/
> > 
> > Changes in v2:
> > - Implement LM crossbar, 10-bit alpha and active layer changes:
> >    New patch: drm/msm/dpu: Implement new v12.0 DPU differences
> > - New patch: drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
> > - Add CDM
> > - Split some DPU patch pieces into separate patches:
> >    drm/msm/dpu: Drop useless comments
> >    drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
> >    drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
> > - Split DSI and DSI PHY patches
> > - Mention CLK_OPS_PARENT_ENABLE in DSI commit
> > - Mention DSI PHY PLL work:
> >    https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
> > - DPU: Drop SSPP_VIG4 comments
> > - DPU: Add CDM
> > - Link to v1: https://lore.kernel.org/r/20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org
> > 
> > Description:
> > =============
> > I got modetest writeback working, but DSI panel on MTP8750 still shows
> > darkness.
> 
> Hey Dmitry,
> 
> Just wanted to emphasize this note on Krzysztof's cover letter.
> 
> Can we hold off on picking up the DSI parts of this series until the DSI
> panel comes up for MTP8750?
> 

Ack, I will try to remember it.

-- 
With best wishes
Dmitry
