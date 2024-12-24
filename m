Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326369FC258
	for <lists+freedreno@lfdr.de>; Tue, 24 Dec 2024 21:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BB510E4A9;
	Tue, 24 Dec 2024 20:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v1anioXE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6688810E4A9
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 20:42:16 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so49610441fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 12:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072875; x=1735677675; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
 b=v1anioXEYaDpJkSou+nZdeZFGnfAxAfUyFfR9g4cwpafM9rUr2pKI0xYS6RCZDvdO2
 iMTSrztbXfW10j9dKUwcxVaGYIRQDuigM0+lX2/y3kJmlWiHOsteZoHHUYyhgmMLqHat
 brBOQJLhLvDDQMbPg6/ElETDm3Odl4JYQ8SeYreenekxq138IZICrShnLx4Y4cZQLUt3
 qsMUvXqw/z5TN+ZnrO59Cy/P91Bd6KAe2GTgC5SjwE48SaTfGL14dGsQpqRaVv2CZz8N
 bHZqS3WIuZq99B/+7O6algqilQT+Q2J10r0swjWU3cQzlOyWcROwWDNaNpx70sEG79Ot
 14QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072875; x=1735677675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
 b=TNy9Njl6dIYBAGbXKmo7FVRAA/66/t0oZ+EXsaGLOhKQGWI0WoAz6508K+yApSju+u
 IrW0EueM841rJv2pnyZuy5G1k7NQHefWWmqecqMlYYRcq0VBI1Se2DnjZztbhwST9UZh
 pUKXExTtUwag7N5sTFPqm/VYjZrH3B79wxe6b7RLzR+HMSNRDjI5ppNLx3WlhH9D+pkx
 JBCUkFoi246vlRg6I/o2gZGiIk0ov6rJp2W5VbKupVkNo1hmtBWDNYDsRglfHGjx2VwG
 6Ki1nzakbnnVtEAMnqEPB7BBM5e0Gt0v6yxdr/Fyr3DhdmO+nDX8dXaUNbT4wGwDXKJE
 QF5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHObhf5AXJBPBHwNkPdBaX9RNIWB0mdVDqJpG0BZqckAFDm6lOAjJh9LZd2AP8mrZhAn8DNxyFKXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHCyFtYNE/6KIR5S+fShM58N4qKo76vtMkhWhENq0Ftc7oUomI
 290p1dIStDnVO8YNRP0m7SDlkqVT4vUgyPfEMuqqjj3XZyQvCkmEIulhhGWxqww=
X-Gm-Gg: ASbGncuz//mabvDc+JZKkx9MSOrNNZChEbStL4qEmNOsost8N3AD3zs2CW+5eb4eKEK
 y4RjgranAdAdJWYD3a99EVYiykIS9CrzKexvgHz6eazbuTS4995kQ4/e5ReeVSTBlIumKoqsJru
 CrpQmarpFyMrroKPORwSh0sPgYp2JIkuccns0FY0c4sV4EmG9PUszimXuwo2gQBbPu4NTfAH4/E
 Q58a+fCHhrBw655ZYRD4PgunPf2rqpXEeewPoz6msVFMg0nXfEGc5RPKwjbE/zQ4Q23h0D/
X-Google-Smtp-Source: AGHT+IHhxMcz5LHKf4mzblqpQkrsMBpik6mK2OqeNWh9Gv38C8o0kVzMu1K4zlNWLn6efCKGHqg6Jg==
X-Received: by 2002:a05:651c:b14:b0:302:4147:178d with SMTP id
 38308e7fff4ca-304685c1ad4mr72800031fa.28.1735072874813; 
 Tue, 24 Dec 2024 12:41:14 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/16] drm/msm/dp: perform misc cleanups
Date: Tue, 24 Dec 2024 22:41:01 +0200
Message-Id: <173507275854.561903.1008800091022451905.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 16 Dec 2024 00:44:05 +0200, Dmitry Baryshkov wrote:
> - Fix register programming in the dp_audio module
> - Rework most of the register programming functions to be local to the
>   calling module rather than accessing everything through huge
>   dp_catalog monster.
> 
> 

Applied, thanks!

[01/16] drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ba3627bf82c1
[02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
        https://gitlab.freedesktop.org/lumag/msm/-/commit/486de5eec0d8
[03/16] drm/msm/dp: drop obsolete audio headers access through catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0caebf37960
[04/16] drm/msm/dp: drop struct msm_dp_panel_in
        https://gitlab.freedesktop.org/lumag/msm/-/commit/429783c22fe9
[05/16] drm/msm/dp: stop passing panel to msm_dp_audio_get()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c9261bcc1546

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
