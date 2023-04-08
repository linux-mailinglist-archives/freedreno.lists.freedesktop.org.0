Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A656DB7B9
	for <lists+freedreno@lfdr.de>; Sat,  8 Apr 2023 02:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BE510EE80;
	Sat,  8 Apr 2023 00:19:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C2410EE80
 for <freedreno@lists.freedesktop.org>; Sat,  8 Apr 2023 00:19:41 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id l16so40800ljq.11
 for <freedreno@lists.freedesktop.org>; Fri, 07 Apr 2023 17:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57HcPU0bVjNRBD2VzJ3NmOqnMURGDJjSzS2VLeSuLyM=;
 b=DHr+UeVkBe9KXl0I1AT+rCbbTdagUZq5LuRuL+pTLJH6x/HrbecmncSqEUJZSzvSgy
 gxcQBNzqMMZdGmRa9jzvl8ldTo00cibKWCuLjwYPR1DV3r9wDveZPssbqPhbFSTIfTPB
 iAna0l4KJpUeHuZD4CcV93O4pwq+oNq0lf1GiXegryqQVE+sgHB5RP/K8LUIazXrsUWG
 ofdeNb7EMa6nz9yuYsfgCHEU+tpFvmc3h+xc4zdOSicFpXnouc+uAoJBB9jOocbEqfza
 z9nrMS5oTnFJT08LBgYx/b6MUT23xsxuTYh5VTIpNJUossH5OhKnsyNBrmotK8FNA6KR
 wMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=57HcPU0bVjNRBD2VzJ3NmOqnMURGDJjSzS2VLeSuLyM=;
 b=mGa0ka06fdNMAY1Xslb3ei6qEx9HcHGFqC8TvjUwYgg+ggu+VU6CwVyWCJYWTMM/Y6
 YgSBF2MJVLOTLNLrpsl3Xsp0La02eVk2XAdX+BlxNXWFitCtnvo7fzsiga8v0DSv7W6k
 n0pC6pu7U4AFQQ9f8jou/vku4nzur+SFH5vgIT7FbMUmYEIoYHAaHUOLZgc3lxcQEUmi
 oypAESNjdetQ92i1gNzYY3ANVEAoissjhS+2+rkCaa6Mz+lYrLe6DPDR06GOoUOR49vl
 zXqG7BHGWEX1PYSyahtgHrHbdHItclozI7eaoy26Vg1F8IctcCzP1WYuj38EuNfiKVGW
 9jaA==
X-Gm-Message-State: AAQBX9e4p4isjkRsrNa+LMksqmS9jNNI9CNk6obfht+Ppjf1nKNn9Zl6
 eSc25P3iCXBjOlo7MjFKU5jeRg==
X-Google-Smtp-Source: AKy350bRXN2zFKtJmnwFM15cD6NKUPDtoQ1g4HFH1TA+02d9oBfPpHYYQmmKmQSDUtxWuoWqieqiNQ==
X-Received: by 2002:a2e:860b:0:b0:29f:390:6642 with SMTP id
 a11-20020a2e860b000000b0029f03906642mr101395lji.7.1680913179345; 
 Fri, 07 Apr 2023 17:19:39 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f20-20020a2e9e94000000b00299ab697a9esm1041942ljk.111.2023.04.07.17.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:19:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat,  8 Apr 2023 03:19:38 +0300
Message-Id: <168091312792.2720696.9740741305690316067.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 00/42] drm/msm/dpu: rework HW catalog
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 04 Apr 2023 16:05:40 +0300, Dmitry Baryshkov wrote:
> This huge series attempts to restructure the DPU HW catalog into a
> manageable and reviewable data set. In order to ease review and testing
> I merged all the necessary fixes into this series. Also I cherry-picked
> & slightly fixed Konrad's patch adding size to the SSPP and INTF macros.
> 
> First 6 patches clean up the catalog a bit in order to make it more
> suitable for refactoring.
> 
> [...]

Applied, thanks!

[02/42] drm/msm/dpu: Allow variable SSPP_BLK size
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8f940ddbc4f1
[03/42] drm/msm/dpu: Allow variable INTF_BLK size
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8399a5ff18dc
[04/42] drm/msm/dpu: constify DSC data structures
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fc4fcfb0744b
[05/42] drm/msm/dpu: mark remaining pp data as const
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac1c5ed678e8
[06/42] drm/msm/dpu: move UBWC/memory configuration to separate struct
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fbbd8cce803a
[07/42] drm/msm/dpu: split SM8550 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9cc547933636
[09/42] drm/msm/dpu: split SC8280XP catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/225978f43986
[10/42] drm/msm/dpu: split SC7280 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f0f2c32a662c
[11/42] drm/msm/dpu: split SM8350 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b8ece0c61e13
[12/42] drm/msm/dpu: split SM6115 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/01f2e9a70be1
[13/42] drm/msm/dpu: split QCM2290 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c22a42bd3eb7
[14/42] drm/msm/dpu: split SC7180 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c9cd1552e95b
[15/42] drm/msm/dpu: split SM8250 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2f36168e3257
[16/42] drm/msm/dpu: split SC8180X catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/97e2c8037694
[17/42] drm/msm/dpu: split SM8150 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/25035306871e
[18/42] drm/msm/dpu: split MSM8998 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1c611c481e8d
[19/42] drm/msm/dpu: split SDM845 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9a4425f404c3
[20/42] drm/msm/dpu: duplicate sdm845 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/460c410f02e4
[21/42] drm/msm/dpu: duplicate sc7180 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7ea3e251a84e
[22/42] drm/msm/dpu: duplicate sm8150 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8589ccd71067
[23/42] drm/msm/dpu: duplicate sm8250 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/586c11233ea8
[24/42] drm/msm/dpu: duplicate sm8350 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9bea40825512
[25/42] drm/msm/dpu: expand sc8180x catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2861ce202cd8
[26/42] drm/msm/dpu: expand sc7180 catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/02538790a8d4
[27/42] drm/msm/dpu: expand sm6115 catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5ce224840b9e
[28/42] drm/msm/dpu: expand sm8550 catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/463ba323aeb4
[29/42] drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8f41187a0649
[30/42] drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5a7e3c008d35
[33/42] drm/msm/dpu: drop duplicate vig_sblk instances
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d16b77dd8658
[35/42] drm/msm/dpu: inline IRQ_n_MASK defines
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e5edf654536f
[41/42] drm/msm/dpu: fetch DPU configuration from match data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dac76a0144d3
[42/42] drm/msm/dpu: drop unused macros from hw catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac7e7c9c65ec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
