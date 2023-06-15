Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E947316A6
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D7F10E4DB;
	Thu, 15 Jun 2023 11:31:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015B810E4D3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:38 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b1afe57bdfso26717071fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828697; x=1689420697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iagvrTdJe16mbe43XCaGjCeX1Svdet6EWcsi0Mlbfo0=;
 b=C1G5NDiXspEzy5EQjsjez+uLoXWTbf1yhJfnfn5dw2nFfd7vBXpmy74ehzhi2gVWO0
 98BA54WhJ6FJm5DDQ0XhB8jkpmXBh0ABSt+sBLjEnLVb88t7lkoqn0ZycBe3DOXs8TBc
 Ezyff4QbewIrBte/SFLoA9fKc7m2p/X8k9i/KE/caEz9NN4kDvxahKkiybJN+8ZangzP
 VkFJNg0xUKAhA2ZEva6jLrkemxDXhe0a4IPVV0jIXYbZKFvSGnJk+O0fwTG3NuOC5m0p
 XjZFWWLSO8+d6tmRyNIzvOhN04zCvgRxHd8UDT3B8XakDsB3WR1xO57QE5JmQLIxnZa7
 RL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828697; x=1689420697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iagvrTdJe16mbe43XCaGjCeX1Svdet6EWcsi0Mlbfo0=;
 b=dEPtOyshcsxIvdJ7D3uj5W2Uq1AprALL5dJeLbdu9do02AOHkLIp27UOVZeHBjIvB1
 aiDEEWPceFOpW4QpIHVo+axYgYG7lU4ujbhjpxa82GVijbsxV3F0mjZL3QQCKnnkjWvt
 CbSL7uCg+jOU81sBeJr+Wq8zPi/CWkmlsad+eFUxtr4j4QrLqSCDWWT21OMC7FnIa0hr
 MUkyZw0TBPrMzACraM1gE/i+i1ZuQQaS/t9iMJiLS2VuDnr3MLL4Y2ZIOrr1NauX3Dbk
 POBKUXfCHGPZRRtxmzaMvwfY6JT3ra1DPhjcszYnLNl22WO0xBCqdppKvyYaySUpqgTO
 4uXw==
X-Gm-Message-State: AC+VfDwZ9KWMmqHTUAidBGbCC9PzKdEhJI//F/LXdIfvWotZa8/JiZA5
 MyQtBn9TPjAfml5GGzcRAj+w5UWAK6QXYDv+t5Y=
X-Google-Smtp-Source: ACHHUZ4Y0HPzWzh+M9sKVmQVFCAQ3f0hHOdfTS1SY7SsZK1b1Ui9Pb4I1jOd1s4VTLjtxaN/by9/4Q==
X-Received: by 2002:a2e:9e86:0:b0:2b3:2f9b:7c9d with SMTP id
 f6-20020a2e9e86000000b002b32f9b7c9dmr6606616ljk.28.1686828697221; 
 Thu, 15 Jun 2023 04:31:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 15 Jun 2023 14:31:26 +0300
Message-Id: <168682860387.384026.9115594076193676039.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v6 0/6] Add DSC v1.2 Support for DSI
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 09 Jun 2023 15:57:12 -0700, Jessica Zhang wrote:
> This is a series of changes for DSI to enable command mode support
> for DSC v1.2.
> 
> This includes:
> 
> 1) Rounding up `hdisplay / 3` in dsc_timing_setup()
> 2) Adjusting pclk_rate to account for compression
> 3) Fixing incorrect uses of slice_count in DSI DSC calculations
> 4) Setting the DATA_COMPRESS bit when DSC is enabled
> 
> [...]

Applied, thanks!

[1/6] msm/drm/dsi: Round up DSC hdisplay calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/21bf617110ba
[2/6] drm/msm/dsi: Reduce pclk rate for compression
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7c9e4a554d4a
[3/6] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag for DPU >= 7.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/22598cfc94bb
[4/6] drm/msm/dpu: Set DATA_COMPRESS on command mode for DCE/DSC 1.2
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1642b5803473
[5/6] drm/msm/dsi: Remove incorrect references to slice_count
      https://gitlab.freedesktop.org/lumag/msm/-/commit/155fa3a91d64

Note, patch 6 is skipped for now

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
