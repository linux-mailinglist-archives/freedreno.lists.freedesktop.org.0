Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1489A7237
	for <lists+freedreno@lfdr.de>; Mon, 21 Oct 2024 20:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C583310E57A;
	Mon, 21 Oct 2024 18:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="exUxLa9Q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B79A10E576
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 18:22:39 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6e34fa656a2so44372917b3.1
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729534959; x=1730139759; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7k7BD7pY8wACVBPmoOy5iE04EKB02xBbu0iFx0TdQp4=;
 b=exUxLa9QnUtC69O9OXahscrKW84ScsC4BG76Z+Bg1eMpH3qLTW+70CnuS+7nvLfTFK
 VEpfewJrL8qROjHU8tBFNSSOYQoA9LPDxiusysvi3+PU87392Wgx0Vg2bA6p8px5MZp3
 R/6QdXiYtJyXsbo/1ZHg9ICswuIw1pUJvXnVCKX07qHNK38zfvvV043Os1QM2+akbPu9
 GGtL408ChnZGuAiFcgTASCxuALmgDiQbo19rW2rGfML0pGAAZlUYxxCsALVw6RzK++06
 lnN8XbWpvJSlSFzL0JLagNeEqxZ1lBrTqBskVsQi9ZZ7weRsWXI77Ui+U/K3NSe8t7oY
 /SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729534959; x=1730139759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7k7BD7pY8wACVBPmoOy5iE04EKB02xBbu0iFx0TdQp4=;
 b=VhS/Cl8FtKEYYAP+WxNVxbsaFVMZBJreTUSsufXvOTj2yvnn8DOlIDQt7FeIS/khM4
 lBAtItc8UxALzk7grB9BCrZHmiHigd7BwTpfe2rfBl2wZpra7mYlTzQ/uAl2Oouzj14l
 CoeFhkpvKcaWNpn+6DH/rx7kPNNSUl+/Ryy3PBomr62Hqdyzv+hcZHeCb7MJVl1WM62B
 VL9aRED3lOPICP7Qk7xy5rbkD+xn9fdYB8BwrQBkK2GpOiMeNCtkBxWbonLYp++Q8AgU
 Zfk4yb4Ac1cDf2+BSy+SfPMOOu3ZiLE2ZhrvyqI6JLWvIcXZHAvD1UOBGcZZPne0h+f5
 ov6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8okFw8e2vVe6RvsE58ZGYzmJ6Alk44OrrAMOSZCr4TJxk3iNlwJzN+OAhyVB9oISqHAJAVh3ETdQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj8IPDTVVLe1pzIM6hdh7LDr5I2RedUbZaebpEjxLwa6f1FPcd
 4v5LNFk4lq06c0tfiUlVDr73j80icptLcxlD8j65VioosIHyMH5FoEv+SNPu/tsvrd7j/difouD
 yuMXFNzWljfILvHmqEGKubtpMl0Ju/NDrRsLqGg==
X-Google-Smtp-Source: AGHT+IGIMQHSXKfZS5IiFigUoVnDbS0TTJP2IKElXl4CLNq16EHDVx2/Vt4LNIpric/HMhxMB7f3RTFLhbckcNrQFR4=
X-Received: by 2002:a05:690c:2b0f:b0:6e3:39b6:5370 with SMTP id
 00721157ae682-6e5bfa05685mr86769367b3.24.1729534958749; Mon, 21 Oct 2024
 11:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <a2d20619-0724-4b16-a9a5-4a3680f21c99@linaro.org>
In-Reply-To: <a2d20619-0724-4b16-a9a5-4a3680f21c99@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 21:22:28 +0300
Message-ID: <CAA8EJpoy=nYMix3m2n7KkwemCNoh_qg8FH0ENaa8VNcLtqZuww@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
To: neil.armstrong@linaro.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 21 Oct 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> > One of the features that drm_bridge_connector can't handle currently is
> > setting of the ycbcr_420_allowed flag on the connector. Add the flag to
> > the drm_bridge struct and propagate it to the drm_connector as AND of
> > all flags in the bridge chain.
> >
> > As an example of the conversion, enable the flag on the DW HDMI bridge,
> > MSM DP bridge, display connector drivers (for DisplayPort and HDMI
> > outputs) and AUX bridges.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (6):
> >        drm/display: bridge_connector: handle ycbcr_420_allowed
> >        drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
> >        drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
> >        drm/bridge: aux: allow interlaced and YCbCr 420 output
> >        drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
>
> How do you plan to merge this serie ?

Once Abhinav ack's the msm/dp change, I'd like to land it through
drm-misc. I think it's the most logical way to go.


-- 
With best wishes
Dmitry
