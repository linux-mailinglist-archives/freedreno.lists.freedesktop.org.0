Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D209EA323
	for <lists+freedreno@lfdr.de>; Tue, 10 Dec 2024 00:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9305910E58D;
	Mon,  9 Dec 2024 23:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KTqvjB3V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3906D10E360
 for <freedreno@lists.freedesktop.org>; Mon,  9 Dec 2024 23:51:17 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ffa8df8850so51769551fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Dec 2024 15:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733788275; x=1734393075; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pRhykAUu7/ugGdmMkmUVswA+egudUm0iBmbFkMPAE08=;
 b=KTqvjB3VW7mEpaVfk1bw/1W4XHa6a/V2qwMxE4nxuKrw+eGjm436CxBy3ZyvgZdqPD
 fzzm+34M1ex+7SbATiPMTB8b1vRuaBFFDKv3FttJB3Sz9cLuy9EsYa7zR04YjkzSv2DW
 JmFIz3CCCHVKHcy0+OtX+R52SVHKxj432oaLYEQc3HQ8CClSBKIxHYOA41GoCXfCwEKw
 1tMuCnPsefTmMW8sWMVB/2vun1bHmzprYRldaMLMKjKM2zERsyTbhonLxkFeKw9B3koG
 nX2f4txUFRhfoGZYb2Ddbie0CKq7uSYXeut1z2Vv7yzMbFAQj5m7v6vj0iV1LwT/E0+K
 kvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733788275; x=1734393075;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pRhykAUu7/ugGdmMkmUVswA+egudUm0iBmbFkMPAE08=;
 b=VN0tM7GkEQkz9S8704GEFLp57/7fvUJ7PLEw3a+T7idNiD8kMrAHbCkz970z74lNDP
 5sI5F/Z+05keN5J2BKZw/D7hTt1vvC/M/Ez9qlFfsrvZFjIQQ7A1JvN+Sb78g79WKp92
 Qa8k3rWG+eF22xxWhiH7u3Ti1f18Cysuk8B3gcSR+KugTfyuaKAybFPOU9YUYPAs2p1p
 pGSxw10KKZDYvak5H+KfEp8fRAbDyus6a8CNu2LTJb/9DK6ppwXeYf1y/quDefhk6zBz
 4BqImNEactZJkNd4QAizBkI000jZuDi8cXawutopk6IXXf/J0inU6X4v5SRBgMpSjU06
 NKKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKJoC9kJPBTN28bytBjjfnht6zbF8WZnxgXoTXwdvuTymwDKc2i2ncI8xs+Fu+5yXV0dbyFXXy2cQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYqGn5LUXjE7WOj+OjXoMetnZk6Adj96FgE9LWXl4eCNtCvocI
 AQTvJCSnGSXf1IjF+2hvJgrDD4p1MzyDIsbfevN/XRFlb1Epz8IACBqXRY6Pbfw=
X-Gm-Gg: ASbGncsbN7WJPX9ALTLUBNr5synNXfflZ2HYUm2ZUvPqlTXeurPiuPKPF4DlxwceRx/
 Hpd3n97+1hbxxKJtVkxUMsanhoq2xExLJIy9FAj1r5hsW7Ad0xMGRyoA8MMpry0amKdkBaB0tQj
 v686O02qN2mO9NfsBqDVAk6WQag/vd5R9rNqIr04RF7wcfOSM3o7JdlpcusI/oyRf1s19yKalSD
 dnsikU0jB7qhoJRkN6fPYqU2J4r8fJvi+1IW2upYyFtz2RaSvHG08DypuRbubetzhZ9T4aLB7DU
 XS3chE/pJ4cgeIYsIeMAqZtahQG9Aitxzg==
X-Google-Smtp-Source: AGHT+IEhnOWNc8nDA8aa1lu4OIkxgMXSLt9ThRjs6xaPkXjn9+eTZi6alA19l127fCfpf/93hP7YWw==
X-Received: by 2002:a05:6512:10c4:b0:540:15b2:fd2e with SMTP id
 2adb3069b0e04-54015b2fef4mr3108085e87.9.1733788275188; 
 Mon, 09 Dec 2024 15:51:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30221998b4esm4881421fa.110.2024.12.09.15.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 15:51:13 -0800 (PST)
Date: Tue, 10 Dec 2024 01:51:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Leonard Lausen <leonard@lausen.nl>, 
 =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <eysj65p526ice7taxh5c7whvyb4o4rnxnydgs6wz5ccnjh5mlj@z6xqdbqqy3lw>
References: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
 <9c42bbb1-bf6c-4323-95f9-0ac9e7426d0c@quicinc.com>
 <CAA8EJppMA-AREJata0MWHCDYC-7ra723zhC4Nu_xD59O0mX_Ag@mail.gmail.com>
 <a22262d5-f1e3-498b-a850-d377f29166f1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a22262d5-f1e3-498b-a850-d377f29166f1@quicinc.com>
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

On Mon, Dec 09, 2024 at 03:36:29PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/9/2024 1:55 PM, Dmitry Baryshkov wrote:
> > On Mon, 9 Dec 2024 at 21:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 12/9/2024 2:04 AM, Dmitry Baryshkov wrote:
> > > > During suspend/resume process all connectors are explicitly disabled and
> > > > then reenabled. However resume fails because of the connector_status check:
> > > > 
> > > > [dpu error]connector not connected 3
> > > > [drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
> > > > 
> > > > It doesn't make sense to check for the Writeback connected status (and
> > > > other drivers don't perform such check), so drop the check.
> > > > 
> > > > It wasn't a problem before the commit 71174f362d67 ("drm/msm/dpu: move
> > > > writeback's atomic_check to dpu_writeback.c"), since encoder's
> > > > atomic_check() is called under a different conditions that the
> > > > connector's atomic_check() (e.g. it is not called if there is no
> > > > connected CRTC or if the corresponding connector is not a part of the
> > > > new state).
> > > > 
> > > > Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> > > > Cc: stable@vger.kernel.org
> > > > Reported-by: Leonard Lausen <leonard@lausen.nl>
> > > > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
> > > > Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
> > > > Reported-by: György Kurucz <me@kuruczgy.com>
> > > > Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com/
> > > > Reported-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/
> > > > Tested-by: György Kurucz <me@kuruczgy.com>
> > > > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Leonard Lausen reported an issue with suspend/resume of the sc7180
> > > > devices. Fix the WB atomic check, which caused the issue.
> > > > ---
> > > > Changes in v4:
> > > > - Epanded commit message (Johan)
> > > > - Link to v3: https://lore.kernel.org/r/20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org
> > > > 
> > > > Changes in v3:
> > > > - Rebased on top of msm-fixes
> > > > - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org
> > > > 
> > > > Changes in v2:
> > > > - Reworked the writeback to just drop the connector->status check.
> > > > - Expanded commit message for the debugging patch.
> > > > - Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
> > > >    1 file changed, 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > index 16f144cbc0c986ee266412223d9e605b01f9fb8c..8ff496082902b1ee713e806140f39b4730ed256a 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> > > >        if (!conn_state || !conn_state->connector) {
> > > >                DPU_ERROR("invalid connector state\n");
> > > >                return -EINVAL;
> > > > -     } else if (conn_state->connector->status != connector_status_connected) {
> > > > -             DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
> > > > -             return -EINVAL;
> > > >        }
> > > 
> > > Can you please explain me about why the status was not already connected?
> > > 
> > > In all the places I checked (unless I missed something), if the detect()
> > > callback is not registered, the connector is assumed connected like below:
> > > 
> > > 404     if (funcs->detect_ctx)
> > > 405             ret = funcs->detect_ctx(connector, ctx, force);
> > > 406     else if (connector->funcs->detect)
> > > 407             ret = connector->funcs->detect(connector, force);
> > > 408     else
> > > 409             ret = connector_status_connected;
> > > 
> > > We do not register .detect for WB as WB connector should be always
> > > connected.
> > > 
> > > What scenario or use-case is making the connector status to something
> > > other than connected?
> > > 
> > > The places which mark the connector as unknown seem to be covered by
> > > warnings in drm_probe_helper.c but the bug report doesnt seem to be
> > > hitting those.
> > 
> > Because nobody asks for the getconnector on that connector. For
> > example,drm_client_for_each_connector_iter() explicitly skips
> > WRITEBACK connectors. So, drm_client_modeset_probe() also doesn't
> > request ->fill_modes() on that connector.
> > 
> > I'm almost sure that if somebody runs a `modetest -ac` on the
> > unpatched kernel after boot, there will be no suspend-related issues.
> > In fact, I've just checked on RB5.
> > /sys/class/drm/card0-Writeback-1/status reports 'unknown' before and
> > 'connected' afterwards. You can easily replicate that on your
> > hardware.
> > 
> 
> Yes this is correct, I just checked on sc7180.
> 
> It stays at unknown till we run IGT. This matches your explanation
> perfectly.
> 
> > > 
> > > I am wondering if there is some case in fwk resetting this to unknown
> > > silently (which is incorrect) and perhaps other drivers dont hit this as
> > > there is a .detect registered which always returns connected and MSM
> > > should follow that.
> > > 
> > > 111 static enum drm_connector_status
> > > 112 komeda_wb_connector_detect(struct drm_connector *connector, bool force)
> > > 113 {
> > > 114     return connector_status_connected;
> > > 115 }
> > > 116
> > 
> > No, that won't help. You can add a detect() callback and verify that
> > simply isn't getting called. It's not resetting the connector->status,
> > it's nobody setting it for the first time.
> > 
> 
> What we found is that drm_atomic_helper_suspend() which calls
> drm_atomic_helper_duplicate_state(), uses drm_for_each_connector_iter()
> which does not rely on the last atomic state but actually uses the
> config->connector_list which in-turn disables all connectors including WB.
> 
> Is this expected that even though WB was not really there in the last
> atomic_state before the suspend, still ended up suspending / resuming and
> thus exposing this bug?

Note, atomic_state is a "patch", not a full state. Thus the described
behaviour is expected: it walks over all connectors and checks their
drm_connector_state information. Some of the connectors (if they were
not touched by the commit) might have been skipped from the last
drm_atomic_state structure.

> 
> I am  now more convinced of this change as I understand the flow better. But
> wanted to highlight above observation.
> 
> > > > 
> > > >        crtc = conn_state->crtc;
> > > > 
> > > > ---
> > > > base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
> > > > change-id: 20240709-dpu-fix-wb-6cd57e3eb182
> > > > 
> > > > Best regards,
> > 
> > 
> > 

-- 
With best wishes
Dmitry
