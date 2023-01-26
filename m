Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5667D4F6
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD2510E990;
	Thu, 26 Jan 2023 19:01:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A61C10E987
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h12so2743590wrv.10
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vGWHx37zinCDKu9NC9wgR73rrVcUbMz6uogy6JTfQQ=;
 b=g3cA3KzWngJBTIKkh8Tchnm74ND1daBcbl93/SnsDa4+ZO9RBTjUIL8auE/xvQhSfV
 1ZtGisCGGvsWchTLKEc5QWYq7a4ge3bWvhoP89nqSiYuXh8saouCG5hZXMyMfJ5QGzvA
 0sArQcwKMzUefdCFBqnxv4xUXB/hcD75TQsPkm3r+TnGzbDQFAsRF+BZzUtKKZZsRTKN
 q7lDMoEDBLyB3q5U9X+cIarzHE2iJ1YiWi/4mgY3Ubc0hLe0AYbXYacMZ027VBi9aKV3
 iRxstRlH/2Hw06DrFGax8WD6GOieakSAk+yzHlzq14FxuoP34bxBskU+MenAh/6ZvEjk
 GREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vGWHx37zinCDKu9NC9wgR73rrVcUbMz6uogy6JTfQQ=;
 b=UOnI0LLo3Klx7wQn6REeHWW689NeznOcqlREvDtOw4UjsfUC6BBO+jqN+OIP7SDzAz
 pN2CyjkPJz5NPKZmkkeTQgUdwxXdSoXGVv1j5M9jOyinHwDJ2Fa5GIXia2tJuF7Fz8ln
 tGeJ1YmrezoXps4MwKx6pkZiIxO2L4O6XyBSZ28QCyzG2DScm7uVmkNA05H2gqd+C/qk
 HLPUNvEJCgPox01XddFNaK2lhZOQ4HTYvxn5k7BYnO8pmLY+mnLKiVLeC61arwqrXV2H
 X/omyIwP1VEI/H2FwvPzIkd1gQZwO0LWPykrH202XjxhixjMbTYD4weXfbJ6Fu++juBe
 V8cw==
X-Gm-Message-State: AO0yUKUXxycHUCR0pEyuzZKM41uuMUTw4YPtFd5hnWx5abGFxnYHKcNg
 4C8fxrf06aedwxIhBfCEw/HEi6C9oeE4PDli
X-Google-Smtp-Source: AMrXdXsub2bhIciA9sIaWr1SDq7Xp+VsKNNpw01yUOHvFW+tAfdJi89lnPxipV/wux8vqehGY34kjw==
X-Received: by 2002:a17:907:6e2a:b0:871:e9a0:eba7 with SMTP id
 sd42-20020a1709076e2a00b00871e9a0eba7mr114189013ejc.57.1674759683172; 
 Thu, 26 Jan 2023 11:01:23 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: phone-devel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 26 Jan 2023 21:01:05 +0200
Message-Id: <167475959089.3954305.3603655147941540549.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125101412.216924-1-marijn.suijten@somainline.org>
References: <20230125101412.216924-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Add DSC hardware blocks to
 register snapshot
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Liu Shixin <liushixin2@huawei.com>, linux-kernel@vger.kernel.org,
 Jami Kettunen <jami.kettunen@somainline.org>, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 25 Jan 2023 11:14:11 +0100, Marijn Suijten wrote:
> Add missing DSC hardware block register ranges to the snapshot utility
> to include them in dmesg (on MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) and the
> kms debugfs file.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add DSC hardware blocks to register snapshot
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a7efe60e36b9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
