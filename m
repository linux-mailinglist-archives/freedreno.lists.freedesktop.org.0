Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F20AA3F711
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 15:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CC110EA80;
	Fri, 21 Feb 2025 14:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HE6f4Pep";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F1A10EA7D
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 14:21:05 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54527a7270eso2189848e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 06:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740147664; x=1740752464; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/C9aXjHUlO1beVy7tJ0igGxNMnAGgKJPjFFb0vrOM34=;
 b=HE6f4Pep4dPS9QhOWLiwv0cpfEhsPLsQ4Cg6jX6eNo4OTqvDXUT3YCDqs2sYLAHHQ6
 O89HAnUgO8kLJDMFjS1NHOIRBBdfsXPMBcgvpZbsPr2dQXmL8hf4WRJPy3DmmQ3FbunN
 0ggzSeR3z/tns8DEOWtGznKQsg5hBuHqIPGZYIPMZ912V+1GvGLetTwqgWRSz4NczWXw
 SRuwZgQAqY7kfvzOGe4AJya6j0BhOVW8y7Cr4fHeVGgUIaHCyQ7Cd5vQoNsYZ9/ssY+X
 3Wh+fwkIkY9XwXRvSHtxhR46qsjEOP78kVxykDbdVqZC8BCRb5BAyv9U/oDUatlZlhab
 pY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740147664; x=1740752464;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/C9aXjHUlO1beVy7tJ0igGxNMnAGgKJPjFFb0vrOM34=;
 b=rGlfn6uwPZ6s7MjPySRIFgIiIuHXt52Mc+eFHEV2e0gob6+iVFUfZN9Tz5tXGEhB/j
 UeDh/1g3JKsCn1v5nvQGdNt8X5Vhoiikhd1nu5ZfT6qfvc72+1oZa0x9ef1z1z20IEhU
 N5QznHvMsxmJS+Vc12T/3BNrcFFw5o24RgH9DNesARQEp9XwJBycXAhGU/7RppxP9siv
 vJNLDxwhK9sCx8CbXabeSW/TUafUuYv/czWwqseBV63ATJDjYoqlOABEdle1V0CpqvES
 6CNl8orITr+LuL6sgUzaKvR1maQVMyYlezSOT4KDIIuhq2q3vFxg8IJCJAmVsi4rp0eg
 /nuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURq3ffOf3cErXpMqIZFZUFBsdbBnR1up32EGxgrnyt2icL77Iw3woGotR2VFLBji2jVIcLYTbf7lU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzNkJzCe5LXpgxMxgZPIPgfRiP6yjbUq7CA/T9V28Qu9rQ2Wv6
 UxzzdpHCW7CdeabWWOCDEo9sM46X61bMYsMCkLt5ra59K46T7d00e9OYPKXA0ug=
X-Gm-Gg: ASbGnct1EfirPJOOAn9ibIjvli+ofImYgR1IGzvKzZpN0rmDMCGohnjJzntnzKslWyz
 oMC97mSYz6hickm0ZiMMib6fsO6QgW3N5SvIVJ0hCEIhyHYEyPvsY+22iTzAPbKzA0o3OLFT8/R
 y9AekqgDkLBGkG58oTcorTYPXrQPIjQlcpWIvKNgjMKc5OR79OanM3wa9STI2xzyLyG+U33LVvd
 hj34KHdwDQS1DK/dT3xJf9iLSuOkjlTQAF93pJf+ZVM7A4lje6+7t/ZPJY8fwwl7dqHRmPOIZ+5
 +40tKxaTIQ1FthMds0ziXaH773EUuwaR4vgxmMnaGdVdZfMA4zYWfbIb+6W7OIDCrUBtQ3v22o2
 gNWpY+g==
X-Google-Smtp-Source: AGHT+IF8eCmACHE+xyiaFgbzM1UlrcuUp3RrCdRSkY2oEDQ/ZZy0v/hj0zGwHShMvQynxpAcMIw9tA==
X-Received: by 2002:a05:6512:3f17:b0:545:2ddf:1189 with SMTP id
 2adb3069b0e04-5483912fc63mr1209704e87.6.1740147663964; 
 Fri, 21 Feb 2025 06:21:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54530db5a4fsm2034136e87.248.2025.02.21.06.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 06:21:03 -0800 (PST)
Date: Fri, 21 Feb 2025 16:21:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <djq577v6e7cnvybegddxfzqgg5eat4ormqyopa4b5j7wa6spfk@jwuy4cash6ch>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
 <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
 <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com>
 <ee7xdxyxjs46zfbotsa6hdmwpsvrkaere2hend4iavcvk6duqn@ogvght5qcx7b>
 <CABymUCNnt0Jiks+Fv8Os=V+zxzPAKMyH-wUpgDNMibWA_KNAxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNnt0Jiks+Fv8Os=V+zxzPAKMyH-wUpgDNMibWA_KNAxg@mail.gmail.com>
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

On Fri, Feb 21, 2025 at 04:07:45PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月21日周五 00:17写道：
> >
> > On Thu, Feb 20, 2025 at 11:48:45PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月18日周二 03:57写道：
> > > >
> > > > On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> > > > > Currently, only 2 pipes are used at most for a plane. A stage structure
> > > > > describes the configuration for a mixer pair. So only one stage is needed
> > > > > for current usage cases. The quad-pipe case will be added in future and 2
> > > > > stages are used in the case. So extend the stage to an array with array size
> > > > > STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
> > > > > stage structure.
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > > >  2 files changed, 30 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc94354faaa816fe74566784844c 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
> > > > >                                      struct dpu_hw_stage_cfg *stage_cfg
> > > > >                                     )
> > > > >  {
> > > > > -     uint32_t lm_idx;
> > > > > +     uint32_t lm_idx, lm_in_pair;
> > > > >       enum dpu_sspp sspp_idx;
> > > > >       struct drm_plane_state *state;
> > > > >
> > > > > @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
> > > > >       stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
> > > > >
> > > > >       /* blend config update */
> > > > > -     for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
> > > > > +     lm_in_pair = num_mixers > 1 ? 2 : 1;
> > > > > +     for (lm_idx = 0; lm_idx < lm_in_pair; lm_idx++)
> > > > >               mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
> > > >
> > > > I almost missed this. Why is this necessary?
> > >
> > > It is protective code. In case there is only 1 LM, we should not
> > > iterate 2 LM in a stage.
> >
> > That's not what the code does.
> 
> I do not get your iea. _dpu_crtc_blend_setup_pipe() is called with
> num_mixers set as:
> cstate->num_mixers - (stage * PIPES_PER_STAGE).
> So lm_in_pair will get the LM number in this stage to iterate.

You have written that it is incorrect to iterate over two LMs if we have
one. The code does a different thing: 'don't iterate over more than two
LMs'. It would be more idiomatic to write it as:

lm_in_pair = min(num_mixers, 2);

And then it is obvious that it is not 'lm_in_pair' (note, singular), but
something like 'lms_in_stage'. I'd really ask you to pull this up to a
caller function and pass a correct num_mixers instead.

> >
> > > >
> > > > >  }
> > > > >
> > > >
> > > > [...]
> > > >
> > > > > @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
> > > > >                       mixer[i].mixer_op_mode,
> > > > >                       ctl->idx - CTL_0);
> > > > >
> > > > > +             /*
> > > > > +              * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
> > > > > +              * There are 4 mixers at most. The first 2 are for the left half, and
> > > > > +              * the later 2 are for the right half.
> > > > > +              */
> > > >
> > > > The comment is invalid until you introduce quad pipe, currently there
> > > > are 2 mixers at most. However you can just say something like 'stage
> > > > data is shared between PIPES_PER_STAGE pipes'.
> > >
> > > Accepted.
> > > >
> > > > >               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> > > > > -                     &stage_cfg);
> > > > > +                     &stage_cfg[i / PIPES_PER_STAGE]);
> > > > >       }
> > > > >  }
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682f26d02074505c5474a547a814 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > @@ -34,6 +34,7 @@
> > > > >  #define DPU_MAX_PLANES                       4
> > > > >  #endif
> > > > >
> > > > > +#define STAGES_PER_PLANE             2
> >
> > BTW, This should be 1 for now.
> 
> Yeah, it can be added in the last patch.
> >
> > > > >  #define PIPES_PER_PLANE                      2
> > > > >  #define PIPES_PER_STAGE                      2
> > > > >  #ifndef DPU_MAX_DE_CURVES
> > > > >
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
