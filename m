Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB559ED9B8
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F0910E08C;
	Wed, 11 Dec 2024 22:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LFUEqPJM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9387B10EC3C
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:31:58 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-4678afeb133so9331031cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733956317; x=1734561117;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=NHbSAVasy0M5518vl1c8RnaP4kK4Vq9FshCC3WUmEd8=;
 b=LFUEqPJMG+ifD32aB29ngTT2TxfbrFqC4+NyCIyurZHEj2rCMqIVuHB1Nw2MPADOLb
 s+V358uWjEMK+kYhu5HxbVLyAazqzrWjzzAb8w/LZlYwQLTIajZPatxm55hybxZk95Kp
 mO1U5737uIgz6ArxhlIP2dNnWPd3hb6ka8in8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733956317; x=1734561117;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHbSAVasy0M5518vl1c8RnaP4kK4Vq9FshCC3WUmEd8=;
 b=fmE+WA3Mr1kjQKGUE9FGz2LnD2y8uW8ONCGZZXCc1z4k5StUlrcYhtYwpXygmlGLuN
 bikFSvkblaDjn7zCJIsji/FSnXisaPRVOmIE1ARjOH1GOX7wuNbRHsWtL9t6nEUDmb8A
 KzGcpMMTrNVoLf7lfgKQs7UpV5wV4c5+h5jLua1fuu4CPngfqnO7CNdJgTE9116G0HME
 RIrrkG6KF0IHd+/TNCP8LaoOcZ4egJSrsiDuL6fxvSewmlGpCo+6zBm/4caQq6RVR4ma
 5AdOwYAIdiMlPmi26UA636p/03fZXdjurtk4iKbjTNg4G34QZv0zVzcNKgduydCPUKo5
 9G+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMaFZ8ig6N71qoRqu74Owaw/3n5gR9vlz5xd++bEochXKzS5G6P9MYxgJzicyOED/d+UE0KQKqYoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhbvtpVvqR47IC68+SN/lDSCqLolKeLFxqEqYkLwscWFpwnqrW
 2Ka77PCdq333SUgh75uFtPASR0oGzwkuTypzW4njTu1Sj+lDLhDTRplFbYiBTt520a8MIIOnBJR
 fF3eYpB8pQVtlGMor7p+mbppP/fVpqG1CypTq
X-Gm-Gg: ASbGncu5w6IuaNpttjexbZapmU7B2rdJkOcEAb9HhPszHRQm9D7VMtuJW9IVxZ7fikC
 tBMkgjYYJ+GmZtOsZXBkhu2HcxldINuChRzyOfGTRbH25bF2bimoB3CvR5ypm11w=
X-Google-Smtp-Source: AGHT+IH0phbrtePElXJxDxj9HI12gSYY0Q06etMElvaeqdDYhA8EkdDjpS2cR8ruv8dvm22YKh6KLSLREA129gVkVUA=
X-Received: by 2002:ac8:7d95:0:b0:466:93b9:8356 with SMTP id
 d75a77b69052e-467968a1451mr15126531cf.22.1733956317709; Wed, 11 Dec 2024
 14:31:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:31:57 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-10-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-10-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:31:57 -0800
Message-ID: <CAE-0n50T1yJEhx+NbcoNbEZ6Q8Bx7asOHHx=bOY_uKNaQ-y8xQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] drm/msm/dp: drop obsolete audio headers access
 through catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:40)
> Drop obsolete functions to access audio packet headers. The dp_audio.c
> now writes them using msm_dp_write_link() directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
