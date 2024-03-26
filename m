Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4888CAFC
	for <lists+freedreno@lfdr.de>; Tue, 26 Mar 2024 18:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC62710EF43;
	Tue, 26 Mar 2024 17:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p0D6W/Vy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E916310E436
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 17:33:35 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-60a0599f647so51039947b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711474415; x=1712079215; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XbZMB0HLDo6UlcT3wdFgHAD3bu+yuJSpDvNYyyVm5Bo=;
 b=p0D6W/Vyz4E/o6rEewPQ598Vkm+6sjH6wqxSHptc/k9NMAR2zpqekXGOOhRrbTdEKW
 RhmkqlYmtLqIXw9jS82Ka0eihSEpX0i5tmNiDqSBAmRzFuqipdKuqCTJwxCHhmw6YPlg
 gWH6swIsQsOlsIDRfEl2HVgzHC3W/CfoqLGkLGcFdfGC0ZC++7yEmGdLRQC3CA0kgh38
 sKi6589QW9abnXlHC1F2HecnZxlYJJKzmh3Ly2jcDL8tJoEr645+uuFdmh7Go+2+bvvc
 h/lUtfhROq+N+ERsumdB8yK6hPI4vwbKdQW1pNT4uhlfdHc4VCZAhnn1GVYmEggcou6Z
 RSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711474415; x=1712079215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XbZMB0HLDo6UlcT3wdFgHAD3bu+yuJSpDvNYyyVm5Bo=;
 b=HvUQgTg9alFovP1Xp6iMlCqQ41bhkeEjIBvBgOhJcb49CvdvNlZ9p58h6Z+bASeb0f
 PYmjYAsI2KLbEax8Eg663Q5cyPKBsxlXjdEr4Cq2NdipkHhbCory/cqBlMm/4VXfHtzB
 5yNiLQ3hIhUbaKDeOK/WkypLPrN6BfpxT8wHbs6RsFhtTvwlyLLYzZc7ApiCc6O5jwF+
 c6AG2MhPMHuyJk9CL4YYCPW6y/jpMsZsinJwIJA7blrxnUUQX9Htk+wsKyYZAHqyOcPq
 2KbHau+8tt7ecggEDdiyDxZZAh6XB9HVtPh+VssqllSg0FNkKvENLBD0jM0l7iE8onR/
 fKQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX73c0TEGtwpHqAbM6u7abYJQQAPz7j3nB1gbHuZYIxlpbgP2PAKlwK8zxj6lKnfJFIEZ5BccSLm7a44bKg0M60PekRToa/Ijzypf8USxz3
X-Gm-Message-State: AOJu0YzieDU6JjXweFugF2/WZ7PuoYyqyAGwHixmXEdArDB3vuk1RXqX
 gIar9OVGTltNsogPey0hJkRwwUi+537EbXowcpE8sDtsHfekbfgZVFSKgYdbZ0/IMuUVl2KE77d
 2uxDppWYtVBGC72xitWnxWu4LluavDIGY6YJ5fg==
X-Google-Smtp-Source: AGHT+IEMWwGPSGxVa+7DBZhN3tDl31SG+GYGcvvUKD2ClPTIyhd+KW7hJPpl34yQMv0yUTu8mGIcSU6SoV3jibi+RjM=
X-Received: by 2002:a81:5f55:0:b0:60a:5031:2de9 with SMTP id
 t82-20020a815f55000000b0060a50312de9mr1681149ywb.51.1711474414901; Tue, 26
 Mar 2024 10:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
 <20240326-msm-dp-cleanup-v1-5-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-5-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:33:24 +0200
Message-ID: <CAA8EJpqxxuu+EK3W55EbhiZyGqnB6DGdH7jU5fP--bZpUHSx9A@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm/dp: Use function arguments for timing
 configuration
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
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

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> dp_catalog_panel_timing_cfg() takes 4 arguments, which are passed from
> the calling function through members of struct dp_catalog.
>
> No state is maintained other than across this call, so switch to
> function arguments to clean up the code.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 14 ++++++--------
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  7 ++-----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 14 +++++++++-----
>  3 files changed, 17 insertions(+), 18 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
