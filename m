Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4620D710279
	for <lists+freedreno@lfdr.de>; Thu, 25 May 2023 03:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5B310E0F8;
	Thu, 25 May 2023 01:41:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92CF10E113
 for <freedreno@lists.freedesktop.org>; Thu, 25 May 2023 01:41:09 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-ba865ac594bso15578276.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 May 2023 18:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684978868; x=1687570868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XPb8KbqWHe/Wn3t/4V1Y6PByW6CmSIRbmZFJX0yAJoA=;
 b=XEGn6iPd5vpeNYMvA41VmOkgGH9AgDadjqE1Oc6nwCKkxYGx0VVKIIah21F9ex3jaT
 1nHhokwPrEz1TFiVl1xbQOZE+GlgROeMww3shaz4TNmkPcszLZxuObGeGu7qamQrTWPX
 ynIrtbnJ4b9huxnbybaPNJdv2AqOvDuH0MOkJjDkGx2ERX9KhfOixkRnWg/TJ4BIqOcQ
 FUlbOGfNDdTyfq85LGQIrLI+HaUM5XVJy7gZ5Pxm+hgSlbywV0GRspY+T9Nf45p42EB0
 60u0JNP6aCh+Ci+jel+2+Pl3dkNGz/fp5FYhMJN0iq/ILafCteqzjcaf3c+JwVsgCkue
 JJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684978868; x=1687570868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XPb8KbqWHe/Wn3t/4V1Y6PByW6CmSIRbmZFJX0yAJoA=;
 b=aqvVO9Br/7VDuuB9/ZcDy5kLW0qYu9XZ7irFvl/hl2PCM1doXEGjrVbb9ZoyK4c98Z
 oV/4vdsKJtNMoNVJlaOBPjuSTsFV9wLHe0qKMo9objavndhprER5gIK7G+m2v/chw2z0
 /2aUx/3m6nLaTdqTN2wF1CHQRqkTjboL+WodfO9CbzGRSr9P5kjgWh7YmA9ggt7PiaeN
 iYKeaxaQ2RtCPzKwjkD+1hOuUtly5CHbtW/8x0jjC6B1Bd3Fmf5F7V7peA/RH3GbNAP/
 21iCMedzgA7vQifESb7PstRAZstkWhCfCfQKMUEU3K5rtiFiDka0LsPnSomc788HpH2G
 90lg==
X-Gm-Message-State: AC+VfDxnOPjeYQacf14GZV7drKEqoT0NOute35l1ku3qWyjk1SHXLZI3
 f7bNUjayPjtXJ/BaXiL0IwXiv/8TS3N8veqvdlkIWg==
X-Google-Smtp-Source: ACHHUZ4G0fhwhIuSz7DkdGZEtTI+BlzFsHD2f9cKjkO/4yG98O1uck+F/1VwYfyRrvBXQKrB7yHxMzYPav9LLRuna40=
X-Received: by 2002:a0d:df89:0:b0:54f:ba89:225d with SMTP id
 i131-20020a0ddf89000000b0054fba89225dmr19776586ywe.19.1684978868444; Wed, 24
 May 2023 18:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-10-dmitry.baryshkov@linaro.org>
 <4af411bf-290c-0818-bdf2-878b2da15146@quicinc.com>
 <f010d346-fdbe-62b9-c403-4928b2e929fc@quicinc.com>
In-Reply-To: <f010d346-fdbe-62b9-c403-4928b2e929fc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 May 2023 04:40:57 +0300
Message-ID: <CAA8EJprOQdotGKv914khFuhC1UGLLwLp0nngPBORYtbCXJ5Nfg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH v2 09/13] drm/msm/dpu: move pstate->pipe
 initialization to dpu_plane_atomic_check
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 25 May 2023 at 02:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/24/2023 3:46 PM, Abhinav Kumar wrote:
> >
> >
> > On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> >> In preparation to virtualized planes support, move pstate->pipe
> >> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
> >> case of virtual planes the plane's pipe will not be known up to the
> >> point of atomic_check() callback.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >
> > Will legacy paths be broken with this? So lets say there is no
> > atomic_check we will not have a valid sspp anymore.
>
> I think it should still work, even if goes through the modeset crtc, it
> should still call drm_atomic_commit() internally which should have the
> call to atomic_check, once you confirm this , i can ack this particular
> change.

Can you please describe the scenario you have in mind? If I got you
correctly, you were asking about the non-commit IOCTLs. Because of the
atomic helpers being used (e.g. drm_atomic_helper_set_config()), they
will also result in a call to drm_atomic_commit(), which invokes
drm_atomic_check_only().

-- 
With best wishes
Dmitry
