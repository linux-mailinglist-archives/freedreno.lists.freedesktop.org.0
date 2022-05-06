Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF35951E0F4
	for <lists+freedreno@lfdr.de>; Fri,  6 May 2022 23:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E09310E1CD;
	Fri,  6 May 2022 21:18:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB8C10E1CD
 for <freedreno@lists.freedesktop.org>; Fri,  6 May 2022 21:18:53 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id m23so10662993ljb.8
 for <freedreno@lists.freedesktop.org>; Fri, 06 May 2022 14:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=stP9fejS4vOS9z6b8S9blkNWUdwkVANwx1E6FrFpyVo=;
 b=n4/nnB14i3bbXfAUe8LWD0Gb/tWV7Rgk629HS4FKP9R1xxEfQo0ZCH1H1wI8LErrJ7
 EhAi6TP0Wi469tHzCy+THoKIY1C2RXOR2kzX7xx5HfjZKYInsVn4sIKcKwcP5Wg8/P/2
 Od81p6KEZOh+Mi3L1LFpIAPukFH8p+D0ZSCwx8a0W/o8TEPwRciHw9c05Kog9VBP0d8M
 JCFST8ZUEBTQZD0nmi5GHIoEgBr/+IosNFzGKBUj1jeDgL4sQAUTYq9Pq/gBbid4eBFr
 Ian2VqHPPUSk/rp+8bt3zYmc7gSvJcbO6nGKD8ZZvalkkXfi28vA2B/ysHqJa75iGgma
 L2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=stP9fejS4vOS9z6b8S9blkNWUdwkVANwx1E6FrFpyVo=;
 b=J0JNhJuydMriyuz24AG/3CF2YldqAJMKvVc4UFoGBtiLp5y3qIPqo4sPUsUZj0mkEC
 fPkTdPNTlg8xR2VVbSP8lt/LcnCsIlOLrX/dt9IkW2/hAMQrOTJGzSYn0GXkGyNi4bC5
 aJ7iXJhFv8lTK28ic+X1KjaFz8VPQOLbjmbhIwbzDFAeOYUK+q2eYdltgaHcPdi/KHHs
 MFfm6GljVoEf0ls1+vlm0xkHS1YHGsz5ObS0ydJ7Kux7LXID0lVPLySfseHR7MAA9HaL
 6K+QBlioLPSjQpNl/EVxunEo5Scaf0RKEqDqEmvyt3r8oe66LtQB/qZTgYGqldlxU6X7
 BJTQ==
X-Gm-Message-State: AOAM530+YB3TiY2uLdcwf8XjJvKOpKJ54s4xpXpMTE74H05ujIdgbhl0
 Ir/Fhj8Ns3YFQJhRoeSvAyj+2g==
X-Google-Smtp-Source: ABdhPJzr0iNtCIEDpvLTjP6F/RcvGnGrP+V6CtBeboAJbEHoWLn9KF0zj8UsKxBkRd632OgHMlkrhQ==
X-Received: by 2002:a2e:8510:0:b0:24f:97f:f7ce with SMTP id
 j16-20020a2e8510000000b0024f097ff7cemr3191127lji.252.1651871932088; 
 Fri, 06 May 2022 14:18:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a05651234c100b0047255d210f7sm826803lfr.38.2022.05.06.14.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 14:18:51 -0700 (PDT)
Message-ID: <a5980cda-61d7-5b94-a089-3e245c0d18aa@linaro.org>
Date: Sat, 7 May 2022 00:18:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20220505214051.155-1-quic_jesszhan@quicinc.com>
 <CAF6AEGsFAkozD1j+padLREzGWNyzq8eVM9YxsX4=P4SROJ_0wA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGsFAkozD1j+padLREzGWNyzq8eVM9YxsX4=P4SROJ_0wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/2] drm/msm/mdp5: Return error code in
 mdp5_pipe_release when deadlock is detected
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 quic_aravindh@quicinc.com, freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/05/2022 01:01, Rob Clark wrote:
> On Thu, May 5, 2022 at 2:41 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> mdp5_get_global_state runs the risk of hitting a -EDEADLK when acquiring
>> the modeset lock, but currently mdp5_pipe_release doesn't check for if
>> an error is returned. Because of this, there is a possibility of
>> mdp5_pipe_release hitting a NULL dereference error.
>>
>> To avoid this, let's have mdp5_pipe_release check if
>> mdp5_get_global_state returns an error and propogate that error.
>>
>> Changes since v1:
>> - Separated declaration and initialization of *new_state to avoid
>>    compiler warning
>> - Fixed some spelling mistakes in commit message
>>
>> Changes since v2:
>> - Return 0 in case where hwpipe is NULL as this is considered normal
>>    behavior
>> - Added 2nd patch in series to fix a similar NULL dereference issue in
>>    mdp5_mixer_release
>>
>> Reported-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Fixes: 7907a0d77cb4 ("drm/msm/mdp5: Use the new private_obj state")
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 15 +++++++++++----
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
>>   3 files changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
>> index ba6695963aa6..a4f5cb90f3e8 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
>> @@ -119,18 +119,23 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>>          return 0;
>>   }
>>
>> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>>   {
>>          struct msm_drm_private *priv = s->dev->dev_private;
>>          struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>          struct mdp5_global_state *state = mdp5_get_global_state(s);
>> -       struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
>> +       struct mdp5_hw_pipe_state *new_state;
>>
>>          if (!hwpipe)
>> -               return;
>> +               return 0;
>> +
>> +       if (IS_ERR(state))
>> +               return PTR_ERR(state);
>> +
>> +       new_state = &state->hwpipe;
>>
>>          if (WARN_ON(!new_state->hwpipe_to_plane[hwpipe->idx]))
>> -               return;
>> +               return -EINVAL;
>>
>>          DBG("%s: release from plane %s", hwpipe->name,
>>                  new_state->hwpipe_to_plane[hwpipe->idx]->name);
>> @@ -141,6 +146,8 @@ void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>>          }
>>
>>          new_state->hwpipe_to_plane[hwpipe->idx] = NULL;
>> +
>> +       return 0;
>>   }
>>
>>   void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
>> index 9b26d0761bd4..cca67938cab2 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
>> @@ -37,7 +37,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>>                       uint32_t caps, uint32_t blkcfg,
>>                       struct mdp5_hw_pipe **hwpipe,
>>                       struct mdp5_hw_pipe **r_hwpipe);
>> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
>> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
>>
>>   struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
>>                  uint32_t reg_offset, uint32_t caps);
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
>> index 228b22830970..979458482841 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
>> @@ -311,12 +311,24 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>>                                  mdp5_state->r_hwpipe = NULL;
>>
>>
>> -                       mdp5_pipe_release(state->state, old_hwpipe);
>> -                       mdp5_pipe_release(state->state, old_right_hwpipe);
>> +                       ret = mdp5_pipe_release(state->state, old_hwpipe);
>> +                       if (ret)
>> +                               return ret;
>> +
>> +                       ret = mdp5_pipe_release(state->state, old_right_hwpipe);
>> +                       if (ret)
>> +                               return ret;
>> +
>>                  }
>>          } else {
>> -               mdp5_pipe_release(state->state, mdp5_state->hwpipe);
>> -               mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
>> +               ret = mdp5_pipe_release(state->state, mdp5_state->hwpipe);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               ret = mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
>> +               if (ret)
>> +                       return ret;
>> +
>>                  mdp5_state->hwpipe = mdp5_state->r_hwpipe = NULL;
>>          }
>>
>> --
>> 2.35.1
>>


-- 
With best wishes
Dmitry
