Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D08004DF
	for <lists+freedreno@lfdr.de>; Fri,  1 Dec 2023 08:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3042210E809;
	Fri,  1 Dec 2023 07:41:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A736210E804
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 07:41:41 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5d35a952943so15481877b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 30 Nov 2023 23:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701416501; x=1702021301; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i0XSc3CmqydMornUaDDfp0sHFoeCR+iaudYxBuXUebQ=;
 b=EmXLiLw83YVjzQRyuhsrl6El6NA5QPPLj6w6otNKM4FzyngpjQsaSjMQxXlYa7MHcV
 1Ou6uEtSgRt6OywBBIRFQtGTpwxUiXS9V8cRrJp4X084aGh8us2fhUApovhWMyJOmm2a
 3liU5k2gdMfJXutEM/bMeh5hY7QGPgOWayMtRQQIvD5wu6nUEgPDBkF0YSHIgpjEQTW0
 6BlqhyZSAVH0LRTuIKlhZmghsnym12mGYOTPjarVXt4NGyE/jPTnrKkVBJZlBV2AaD8A
 ncEtcw5SlGJePCd2TnUdsHS+tQPywTvMv3GQ70SFMUvPiUk4lZjOv5WeUO5sKLNZ/aRz
 zYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701416501; x=1702021301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0XSc3CmqydMornUaDDfp0sHFoeCR+iaudYxBuXUebQ=;
 b=fQ/6Sd2fFhpSUQgcCJsNplv/p3WeGd5936Piagl8FHvJOxojfKl4SkZN1rKZzupjeB
 hVk760zX08QBuXZx8VWcFqUD9CmbsWVGJZGnwt1ZCyuBklrr25osbFmcV1hm4G8ccLLI
 5lVWWiaJfCp/vcZFuId1LFCS80jbBBvNRA4eFmcxlWPc+zlZATbZZi3YyFrbs+yOY0VI
 U4FgBH8ORgyYHjxAgGhrxwTGTtScEXwjhHN0frntoUChCOTO4Vfq495uSknPHiFalP/p
 F1oTrdo++wswWMzcKt8fFUlahkFZYReFpVr2toXjXstGwfkxwbAD87Q5bfdZ6dLKJFTS
 ASHg==
X-Gm-Message-State: AOJu0YzNnkH8Af6qifHlP+bMxIlE3iln1qeWA2+w7YvbT5ZIcLZZi1i+
 xuRdao14KZSLggI5ZAU4F8tTCdcecCboXiZh3oIwcIk0UBsciAT7
X-Google-Smtp-Source: AGHT+IHdkwEvjszcJvfywc8Jpimsn1KEvtMQIBx9T044fmlSpJfllVrTTdQUFvJqGwQtnx6zsdDOuMBQYw8GmjCE0wU=
X-Received: by 2002:a81:7808:0:b0:5d3:c23c:d6a with SMTP id
 t8-20020a817808000000b005d3c23c0d6amr2594670ywc.18.1701416500809; Thu, 30 Nov
 2023 23:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
In-Reply-To: <20231201014101.15802-1-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:41:29 +0200
Message-ID: <CAA8EJprzcWTmqkUNN2r81APkv3rE039xhmaZW5=Zp7WkkQ=pHQ@mail.gmail.com>
To: Paloma Arellano <quic_parellan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 0/2] Stabilize use of vblank_refcount
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, steev@kali.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> There is currently a race condition occuring when accessing
> vblank_refcount. Therefore, vblank irq timeouts may occur.
>
> Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.
>
> Changes from prior versions:
>    v2: - Slightly changed wording of patch #2 commit message
>    v3: - Mistakenly did not change wording of patch #2 in last version.
>          It is done now.

Usually sending a series once a day is enough. If you have any pending
changes, it might be better to reply to your patch stating that you
want to do this and that, while still allowing reviewers to respond
(and thus you can incorporate their review in the next iteration).

>
> Paloma Arellano (2):
>   drm/msm/dpu: Modify vblank_refcount if error in callback
>   drm/msm/dpu: Add mutex lock in control vblank irq
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 +++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 +++++++++--
>  4 files changed, 30 insertions(+), 4 deletions(-)
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
