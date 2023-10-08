Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C8C7BCEC6
	for <lists+freedreno@lfdr.de>; Sun,  8 Oct 2023 16:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A000C10E195;
	Sun,  8 Oct 2023 14:01:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16EE10E195
 for <freedreno@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bfea381255so43679221fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773689; x=1697378489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFEz00dZt8b8WAE9A9YPgyljR1B8wQKrMenQPX4nHKw=;
 b=YRuzrK4Djd7bBYlQmgCQyGSyam61UGAyUNjSs8V/Sf4Fas2p8SlVy9Nbzn30bcbMIA
 GTKbF+zVj0SfIWdDtjuWLTUkTZRlQuT/cmDDLuFNngy7Ukr9OTK7/6dQRce14SUTC81Z
 JGkeyhaX1QXw1ihLTyL44fBTbQVigY1WSNbfR3yafjG9usqA4ChzztVLewlTg6d05pC+
 GgIjRMpRgEfVWKLpxQ95u7OORz736kFKai7dd8gMRujULTg3e+tc9QDZUaPFVZsZrMOi
 9OcV/HJbAj3AODFZdoBNK30U1LkSkG9OkBCpyOw/HHQDa+Hso6y/ypP5w2YQ6Xg1hHaF
 Jx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773689; x=1697378489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zFEz00dZt8b8WAE9A9YPgyljR1B8wQKrMenQPX4nHKw=;
 b=MBzaJenUqJONB9Rui6iQMqVphDQQ5Q9MKcPv7I8sVwG9Fw4gsaLgYRmAPhzt3iQEUn
 Zy0UWEbL1VYjG/afp0tIf+X61pMccCf4MUkjwF1xcS9hQ1jMaOupfLkeBZRGxMy+JSEN
 rnwUo5z8kfB51qnVT7CN+bO3MwvRS2cO+b9OG6n/Q+dPe5hjCBWYasgx4f7rcthMisJa
 5wZ2fyj3jHR5WVFMiWVRNNoQ0FlvGMLtWydTPrAVSikQAPSr+jLvjJ6cZDo7/yMxUaL0
 fqnmaSEEH+A1jIpJuWVpQSmgafWHgvD45ZuL9ek5Bxyn3XXn6+90W3MBP4ZaDR7Q9A6d
 AYKw==
X-Gm-Message-State: AOJu0YxgnExrc6IISzcl9rdPcuDY0ewYw2XnngBz9pdqxqIIXX7B9EA8
 ubrOExrdhpUyWfuU7kSfImDavw==
X-Google-Smtp-Source: AGHT+IFOU5uXWmhXrIYbhgEpr4JZ8+yZty98yxpFi9UjGcKnTHEbTZyEkAOOOPx1Erbruxp2wwdBBQ==
X-Received: by 2002:a05:6512:68a:b0:503:26bc:b08f with SMTP id
 t10-20020a056512068a00b0050326bcb08fmr13838821lfe.24.1696773688970; 
 Sun, 08 Oct 2023 07:01:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>
Date: Sun,  8 Oct 2023 17:01:20 +0300
Message-Id: <169677306906.2570646.11717295539692431609.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230829184735.2841739-1-swboyd@chromium.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/7] drm/msm/dp: Simplify DPCD related code
 with helpers
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 29 Aug 2023 11:47:25 -0700, Stephen Boyd wrote:
> This driver open-codes a few of the DPCD register reads when it can be
> simplified by using the helpers instead. This series reworks the MSM DP
> driver to use the DPCD helpers and removes some dead code along the way.
> There's the potential for even more code reduction around the test
> registers, but I haven't tried to do that yet.
> 
> Stephen Boyd (7):
>   drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
>   drm/msm/dp: Use drm_dp_read_sink_count() helper
>   drm/msm/dp: Remove dead code related to downstream cap info
>   drm/msm/dp: Remove aux_cfg_update_done and related code
>   drm/msm/dp: Simplify with drm_dp_{max_link_rate,max_lane_count}()
>   drm/msm/dp: Inline dp_link_parse_sink_count()
>   drm/msm/dp: Remove dp_display_is_ds_bridge()
> 
> [...]

Applied, thanks!

[1/7] drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f906b95755f7
[2/7] drm/msm/dp: Use drm_dp_read_sink_count() helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/284a245d8bdc
[3/7] drm/msm/dp: Remove dead code related to downstream cap info
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8bddc2d12e9c
[4/7] drm/msm/dp: Remove aux_cfg_update_done and related code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/62ebb19fb32d
[5/7] drm/msm/dp: Simplify with drm_dp_{max_link_rate,max_lane_count}()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a9905b469931
[6/7] drm/msm/dp: Inline dp_link_parse_sink_count()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d89ce4cdb7a6
[7/7] drm/msm/dp: Remove dp_display_is_ds_bridge()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b41c5ca70684

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
