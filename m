Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F588CAB5
	for <lists+freedreno@lfdr.de>; Tue, 26 Mar 2024 18:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943DF10F13B;
	Tue, 26 Mar 2024 17:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f5HCXBY1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7546E10F11F
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 17:25:42 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcd9e34430cso5989594276.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711473941; x=1712078741; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TEdNW8/uGdjjd6EX6eCNJ+oK6HuOhO4oxjWYMugQ7qE=;
 b=f5HCXBY1xmqRxXSEIy4hDTrHRmKPhP30VKQFz1PZv9z1233nZPNZihJ2st6p4tWjgB
 P6pHJyU5jOMXicfV0mpoC3jjji/J/YbCySoYcP53fZ8UgdvvsJ1XZITsn04CQExQtDaz
 v8MlxOJ43z8NxJXh2xM5b3bbztZP5rzQ4c94FpqYyNXrNCQ6tbN+HFBRjtJM69CYTTjq
 Qf4JpTpz8pTsUFlSymQm3Bbw0MqynV0gfV7evux/Cz2667huMQs9JfVsDG6Dmtaay00c
 oQrDCAFcxkuEjBvszRbTYt+62g5Rfe9LQ2ZRIMcfosTHwU8xi2o6z0+e3+nuiiG7AtkO
 J85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711473941; x=1712078741;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TEdNW8/uGdjjd6EX6eCNJ+oK6HuOhO4oxjWYMugQ7qE=;
 b=pTC/wYJjrqHSqibJwfV4ozXW0UpRr5hVKxL0jeKCoTH+uQmnNnhJ51nKutmR+xNpcz
 faligvvy6AHCuh75G8uBMIzEogs7Hin3TeHdMB//gQyvaIGogLzb49KXe050MRKrpPe5
 7QKuW+lOI0xxz+W6gly2flWTGE/ehlfBd6+IPiCxAu53S6GaDmnt3JQjlqDE46o8f8Qh
 /lUgRpcWa0BAwS6GKkPATetrfsGzP95rd7zfBIGcwU8XkqJLi/bb3w+oHpgqSGDT0o2v
 h6CF1E6mbZJIegmXnuCyFahPBL0XhRLm4N6qBnBxmt5e1cDHYKNBkQWeD767CkAzGzWf
 0xpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFWFwzwSiQsPcL8hWBK49D2dxXHh5sbAl2UIEFtMGOAndAH+F9GBq/1HQLaDxPysljnV3gV3w+h+DnrDiKRk8oVo4MpFF+EdHl0+xFpuSX
X-Gm-Message-State: AOJu0Yw1fHz042XdpUVLqO6X00j6h1CQncN8hiu2lJfqNo+hIbjPU0+B
 1cYgHjhM8nzJhv/Rgc012PRLnd9df0J/VvBKkgqxiq3/FAfYbpRuwUF9vBVT8fcwz6tzjr0gAkm
 gmKvCNEIIbXiP1zsVkzMj8zY2GrJpuaK4GE6z1w==
X-Google-Smtp-Source: AGHT+IElgsfXK1k0/1DM7zOc8OoCYkRnDISpRbo+Bkm3BattXbANP61MPSEV6vui3iEtoCHBc2Kn/kL4l17pBRyy4Qs=
X-Received: by 2002:a25:db85:0:b0:dd9:2a67:f470 with SMTP id
 g127-20020a25db85000000b00dd92a67f470mr1553098ybf.25.1711473940945; Tue, 26
 Mar 2024 10:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
 <20240326-msm-dp-cleanup-v1-3-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-3-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:25:30 +0200
Message-ID: <CAA8EJprVYSSXj5y2TDLiUVTR4r1qaYjgbBDswaHAFeapQ0wPcw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dp: Remove unused defines and members
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
> Throughout the Qualcomm Displayport driver a number of defines and
> struct members has become unused, but lingers in the code. Remove these.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  5 -----
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  1 -
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 17 -----------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
>  drivers/gpu/drm/msm/dp/dp_display.c |  5 -----
>  drivers/gpu/drm/msm/dp/dp_display.h |  3 ---
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 --
>  drivers/gpu/drm/msm/dp/dp_link.c    |  4 ----
>  drivers/gpu/drm/msm/dp/dp_link.h    |  1 -
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 --
>  10 files changed, 41 deletions(-)
>

I'd have preferred to have this split into somewhat logical chunks,
but I think it doesn't make sense for such cleanup.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
