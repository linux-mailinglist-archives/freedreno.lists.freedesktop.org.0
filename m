Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3E7704D3
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 17:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781310E72C;
	Fri,  4 Aug 2023 15:33:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D827810E725
 for <freedreno@lists.freedesktop.org>; Fri,  4 Aug 2023 15:33:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe5ab64a26so1250737e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 04 Aug 2023 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691163201; x=1691768001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2lDqiwz35BQibene2FfD8lrq9i3EOhYkHMGMZsm/j4=;
 b=oMchbnnfu/8fyfd0LvESvGZ4gXeW+1J+fm5Yhsa8GUoM8EIDXYMJ5WGaIXYKGuiorV
 ixEbrUc7Rt2pHKtsK79uHYWPhQSeJ/hw3fMsqd98zlq8PxYcWuQ9IGSxIpAlIYcOTRf4
 VFnPB1pBw5yYnVnNSdS+6KudIL//HURVDuVZbERy/RkCYaAthVw/kv8k4GE1OVM7DgZ3
 EBZpQ4JDhNHh+YINlNwUxs0rWWIy95gXdf7fdGePCHJQ7MiYId7qBmsarMG1vm16eqH/
 aDUcyYsbM5VZJxFH7ESkrraV2qr1+okccYDDINHNtwhjjNXWhDzufEqD54ZXQQ/bAhFp
 X66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691163201; x=1691768001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X2lDqiwz35BQibene2FfD8lrq9i3EOhYkHMGMZsm/j4=;
 b=BAtj2LJhDLdFQ5/c4APCoc7gh4ne3z6ppzMWZhHEuR/5M3BEfQ8QEud9S28VwuCQdX
 0ppZ7JoW2hvWqzB+ETi/N9jZFRKsOk97mkKwgojVROiJaReeVE46vcbreLpwIACUMckN
 /niLASKwYFHQw4AXuqcB+R7N68S15QA4EfTubR9o4zLD/Fa+pzMIVenflGU5n41uKeeO
 X7zPewoYoSEeAZKncXaodja+SSLb9kvy0YjEE2mB+IBlYtP7zjWt5tbzsrM+zb/9UkyE
 cwPBlngH/Hr+76aqUK500dJCdFCr6bXFL2AmLxC94YYKoXP8vJdsm/aNFbKaSUuWpxCN
 8k+A==
X-Gm-Message-State: AOJu0YxTzSaWM6EDt6oIFWE3tOvJtp66zti+TDkjCEfc3TY9RN4TT08Z
 mrpMzllFzvvHLw8ZFlbxEMsgEg==
X-Google-Smtp-Source: AGHT+IGow14D3i6LCW/akM1kEPHox7qVuyqMgXZd3Gf68lKDr4B22u2NXiK2kEbqvGaFMdxoaCXyaw==
X-Received: by 2002:ac2:465a:0:b0:4fb:cabd:2a66 with SMTP id
 s26-20020ac2465a000000b004fbcabd2a66mr1179171lfo.21.1691163201016; 
 Fri, 04 Aug 2023 08:33:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 08:33:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri,  4 Aug 2023 18:33:15 +0300
Message-Id: <169116308156.148471.11222648448148490850.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
References: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: Don't leak some plane state
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
Cc: linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org,
 dorum@noisolation.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 03 Aug 2023 22:45:21 +0200, Daniel Vetter wrote:
> Apparently no one noticed that mdp5 plane states leak like a sieve
> ever since we introduced plane_state->commit refcount a few years ago
> in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
> early by tracking commits, v3.")
> 
> Fix it by using the right helpers.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/mdp5: Don't leak some plane state
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fd0ad3b2365c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
