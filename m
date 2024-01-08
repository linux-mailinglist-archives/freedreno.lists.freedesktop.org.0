Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A522827ABC
	for <lists+freedreno@lfdr.de>; Mon,  8 Jan 2024 23:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546CD10E2D3;
	Mon,  8 Jan 2024 22:43:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ED710E2D3
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jan 2024 22:43:44 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so1581657276.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Jan 2024 14:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704753823; x=1705358623; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yWZ/93/0FZh/gn5cm1zBSBRnDMVQRiaGGWGBlyAPerw=;
 b=iR44LteKY/CR5P+NTTQVaTD7Y5aXuk4e8RUyizoNRFPcOyTMbuF+aKloICGtB76ReR
 WUoL3rck/yNVJWgPIBWteQ+a8caDjU7LUjLVJrEgBOT5VhD/3iFuGmtUI7qDpLVO8ZvS
 DJnV1PY8hSwyMlFMWTg24ctxFUXAGWTef/eyPUrb5eXrqUUMtKNSPxr9fu9ynNLnVS89
 VAbnsTz86Ydfzf8VMgi0N4FIA5O3cxOYVzgb6bsM4C6VxDkX820yOy8APrGsmRVJALwc
 iuVx2vr0Zi0exqW5HPgoU+lE32k6vdQ44D7szjdQvxXN+zficWsjArj7+BbJ8OKKf99C
 iTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704753823; x=1705358623;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yWZ/93/0FZh/gn5cm1zBSBRnDMVQRiaGGWGBlyAPerw=;
 b=IgPA4XWepbT3dAEYiQiM/JxbxjLI4mr+lH9eHjBfbUNorj9NM4jqxxCKMBshrrrFEL
 O47SypxaUPGFcYGAhXEcmgy0PyOM5jtL87UFGUMjSUCDHJoX9SBqHIwqzL/GOVTSc1Ia
 yjDFoWVFuTVVEgYjiZX4y4O5HdfxFWmhyBo9fMwau3JqEE8KxVWDnKZGhO3wKxeNtzjH
 yABX7FEthJH+pgSd5Jz1hlhYIM0W6PKlVPIMcEiGGggxZfAujYGuyLxrVec1m1HHnGdK
 xQQLY7zajLCZjP5VKoEZM4mZ3h7vWI49oTu3M74f2kkrkys0plI/2Ld37D3iRte7ULNJ
 0akA==
X-Gm-Message-State: AOJu0YxeZhyQbrTRP7J9d7UeB/tlr0C63sx+yqdo7tp5vBsDMdk7XqMh
 rcKH2FnrBSZYXjrszTr6seViFr5q0lWmOxvD1+acCuXpz7p9XA==
X-Google-Smtp-Source: AGHT+IFdl1xSh3s2jD5qgED4ACRR92qOyXXHTlK0brp8aUmpvjPvWC95g+KDfZXY9Fwki8NSHqhSBb3lWuSIPGPXyf8=
X-Received: by 2002:a05:6902:2510:b0:db5:4d4b:d8a7 with SMTP id
 dt16-20020a056902251000b00db54d4bd8a7mr2127690ybb.50.1704753823315; Mon, 08
 Jan 2024 14:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
 <20231225130853.3659424-5-dmitry.baryshkov@linaro.org>
 <2a536654-b5ec-3599-6f0a-2e369b080c70@quicinc.com>
In-Reply-To: <2a536654-b5ec-3599-6f0a-2e369b080c70@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jan 2024 00:43:32 +0200
Message-ID: <CAA8EJpohQoApcvJuxt5_Xxjx88xSCxPyCkeAbXHsG7s1_6o3wA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 8 Jan 2024 at 23:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/25/2023 5:08 AM, Dmitry Baryshkov wrote:
> > dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
> > Move corresponding checks to drm_writeback_connector's implementation
> > and drop the dpu_encoder_phys_wb_atomic_check() function.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
> >   4 files changed, 64 insertions(+), 59 deletions(-)
> >
>
> I am fine with this change with respect to how the code is today.
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> But if we start noticing a pattern like below in dpu_encoder.c's
> atomic_check,
>
> if (INTF_WB)
> .....
> else if (INTF_DP || INTF_DSI)
> .....
>
> then, it will demand bringing back a phys specific callback.

The problem is that INTF_DP || INTF_DSI does not have the
phys-specific implementation. So while I agree about the INTF_WB part,
INTF_DP || INTF_DSI either should go as is, or it should be refactored
into output-specific handlers.

-- 
With best wishes
Dmitry
