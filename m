Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A308044F8
	for <lists+freedreno@lfdr.de>; Tue,  5 Dec 2023 03:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0011C10E46C;
	Tue,  5 Dec 2023 02:34:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395D510E469
 for <freedreno@lists.freedesktop.org>; Tue,  5 Dec 2023 02:34:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50c02628291so435770e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701743647; x=1702348447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhRAfItPAzMnDYBgmUAMNh2g7r8OB05QNjxhfx4Zxeo=;
 b=RgiIfa/FKBuL4pu/bviwweF1lT0nr/dIbnjUc/hnk4CHmU/EmRThorZz64+mnCpqwY
 lIMo5SUzvvyBw0fsA8ZDzUhGQSYsdNzdor97FE9Ayg5M82aLIPyWLayrXN5PAlaQ9NMz
 qsekAOqOTtNItdLsTPcEnq0NwW2peVc0cdJXeFngxIK0zbTMyJVPRQceD8YBkNGx3O6t
 Umk7ruZzbYKMXoLEm8asN8C0UvbD3crQDj3pBd1tFcg5qNeAPJE6p13kku7dsXcw0dAj
 WiT/UIgVyx/bYo4lNJjT8rnoQX5iuoXoAsu1ZqfAPlTu1MUEZQCF+1u/ySZwJqcojXdA
 zDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701743647; x=1702348447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhRAfItPAzMnDYBgmUAMNh2g7r8OB05QNjxhfx4Zxeo=;
 b=TXfccob/JtEouJECDllDPDPGH4RNfPb60+w78Y3Yfx8ghq2D9K/9IldNDng66HEtwm
 jfMXiEZIKGGNB+7egIdj+nLBUKKTDgFjCX8YqVeT08bfemu0jxitoarJRDoKos8loA7J
 iuWv0MURdUNz67ddBTKPYW+zn0riEvIVJ61DcA7C4gfhGJAPuPsDE8yl7iicZDi55gmV
 /MiFytthcW00fRH7GbxnM5lQKrHpQ0QO6SRNraA3X5INduxCosy47GdjTQYQb0O8UMFd
 ntQUl00yZ9IagSBW+58I7cYZmUzFjRpCk9ctpteZdd7yoLV3BEF0nfmZ+ohzKIfYpmAp
 odKw==
X-Gm-Message-State: AOJu0YwSjNlHrkPYSbqTR2KLWgsSA4KNAD5oKEa6Zxc9SopF6T8TL6ER
 kQyP3yJOYa0zZRwIg9hWa4gMZQ==
X-Google-Smtp-Source: AGHT+IHIN9E/fHUtnZe09D2pmxsbjqYlprqqmhLcEbCwIYJTWISDKsi1X0saj2S5NUUNl461ONRdsw==
X-Received: by 2002:a19:434e:0:b0:50b:f478:a12c with SMTP id
 m14-20020a19434e000000b0050bf478a12cmr1209579lfj.2.1701743647480; 
 Mon, 04 Dec 2023 18:34:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bi3-20020a0565120e8300b0050aa6bd6d8csm1415483lfb.178.2023.12.04.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 18:34:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue,  5 Dec 2023 05:34:03 +0300
Message-Id: <170174354266.1582017.3052319983064321564.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 0/4] MDSS reg bus interconnect
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 03 Dec 2023 01:42:43 +0300, Dmitry Baryshkov wrote:
> Per agreement with Konrad, picked up this patch series.
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects. from none to otherwise
> inexplicable DSI timeouts.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/mdss: switch mdss to use devm_of_icc_get()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ded61d7dc5a0
[2/4] drm/msm/mdss: Rename path references to mdp_path
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fabaf176322d
[3/4] drm/msm/mdss: inline msm_mdss_icc_request_bw()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7323694e118a
[4/4] drm/msm/mdss: Handle the reg bus ICC path
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a55c8ff252d3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
