Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D8E7EBDC6
	for <lists+freedreno@lfdr.de>; Wed, 15 Nov 2023 08:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A61D10E4F9;
	Wed, 15 Nov 2023 07:21:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAADB10E4F9
 for <freedreno@lists.freedesktop.org>; Wed, 15 Nov 2023 07:21:11 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5ac376d311aso72047447b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 23:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700032871; x=1700637671; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0vD1Bck5HDYUM72yjoV0Q8qgtg6QFL0VXndDmXOf70I=;
 b=bLi0eIS4EjWZP1hOxjRdVsWad9XlIQUBDIaIKGdJDfzYyfSCHGwNspEdEeyDBOd7cK
 EoncKvqCf4ei7lZFnJtnv21zlWeyU0kTrDh6xpqdswx0Ww+90dT1sYpQM8vPzJiDjM2y
 nhVGyg1BRFNApYrqwaQfdjsSsboUzbqguBaq0VP02+Iir2bUCk/WpoYRXacQdM3FKT44
 C/VFgWAVAFGcvvyls9M1cClBBYtZr6kHiaEqEwFcfp2r6fuNSvEZJhCaxWw32QhyjxMh
 XzvKVrodTqDDvJBkHugeJHp60b386bZA1DeYMjT3PqPRG/zknzRoV6VSqhwSwln6qJsS
 M4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700032871; x=1700637671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0vD1Bck5HDYUM72yjoV0Q8qgtg6QFL0VXndDmXOf70I=;
 b=BiebErM2mQjAtJH6jqyi/iMLFGTDsQojW6yqgTovnLEaRUB/huRA3d6FRrSIDzEOU5
 VgfsiukQ7U9ippcuJJH2thxHBo5O5bNJ3QSEcjVdoNoLKRCZVbjXn5G6yfgfwbN2UJau
 yysfbZFSSDzhqV9pSuU3dH6erTSmuqinHOy0hHMWXsvzsG3eQBLQyPHdnxpH5QAO4bo9
 PGGyeyRgLyem38se8eZYcmGm72C8J2qHjjUEzgl4/70yW0PeeArBiPoetg3yfuE2wyyc
 wfq+d2+VDp053EyEUXcESICk4nOLjk0Jx2e9QWRWe7Cdxa0raF5R0Gyq4oNd5KxIRWt7
 8Rtw==
X-Gm-Message-State: AOJu0Yw2j5MZBVuAOUlZHOSCScx8QcU5KZV2i/Z4SgLKeXq88OON59d3
 fp5ihnXnlP7p+OUbxAywT5NWjB/t4jCsMWW8nqvE0w==
X-Google-Smtp-Source: AGHT+IEULgD391byZsXPtXNbPcw0yCylBtdnLApeQVAUxwBDpohA/yg4/aHXgsob+pZ1sRHJYNKdu3NZUuCiQiUASW8=
X-Received: by 2002:a25:107:0:b0:d81:89e9:9f48 with SMTP id
 7-20020a250107000000b00d8189e99f48mr10803617ybb.63.1700032871066; Tue, 14 Nov
 2023 23:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-3-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-3-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:20:59 +0200
Message-ID: <CAA8EJprADPYpJBUkq_TA381xntkfHbBVMm5h4qwwg+vM7GzzRg@mail.gmail.com>
To: Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/6] drm/msm/dsi: set video mode widebus
 enable bit when widebus is enabled
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
Cc: freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
> driver is doing in video mode. Fix that by actually enabling widebus for
> video mode.
>
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
