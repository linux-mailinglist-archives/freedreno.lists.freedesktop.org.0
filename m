Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1C567D4F4
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC46F10E98F;
	Thu, 26 Jan 2023 19:01:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6239010E983
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:16 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id mg12so7691505ejc.5
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9GuZIQFiQiPaXRH54eN2BlHrDLxxiKxYVwEtE53efA=;
 b=Ls4xDl5ETNxM4rGQg/ALFS1DnJdwaHO8rUjvrCve3UHHfUGrE5T/aKPakNWoAbEmRi
 YxI3xWWHOo+j6pFL06KYxnoq8kWpaHgcw1SnD1iHaJNmjLfpjnXT1w+iIYgcXHFt5YeB
 Q/hdXuiNk4JgQ5OsO54SChqNONavdWTDTDDJtPBohXB8J74mOTZzgLmuT+Iu5cV+s3JB
 +blkT7pkT0ceTmVj66qMq0IY/YQVSbqXR3Tp9AXUdEWEgKIDPeVTBdobBmWS8MWhSTtx
 XvbvrgfP+vZw1NaRNRcy7y/wUGSIfWMbqiQEflDlyR/LjGSYqeL7xGJIXrMRr7peJjUJ
 dEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b9GuZIQFiQiPaXRH54eN2BlHrDLxxiKxYVwEtE53efA=;
 b=4sWqqdPcaVPLu7BrqAPGJ4jZcRoRcYVQD2DoJk8qc1MKRMp7TVVMrqbAgWH54GK8hD
 k28btzM9FiSoKcj10V7FWohM3619b4z8T8cuZ5V6SJeBR1FmJIS3bB2+72Mi6ldqZNvF
 IACDJ5cQDy1CG3/rNnbxTloDI1czCuO0XvcXX/37EMC6EeC+jAaq9pPfO2ubiOUeq0g4
 nVDGdPADJzzWK2yU0ELni2vIb8bDN4Q5X45Qm8tddgg5NsefvBHMG8UnplOung5Hd9Pd
 5gLO/D1aHgzF38KxQ4x7h2nHTARm/9aDLvwhJQBYR+D7oySy3FzlIZ23PO1KdA8xvupV
 jWGw==
X-Gm-Message-State: AFqh2kp+LTA92w0a1aF2ZVPACRy3txbFP2G1ocyJZ/dfNvU0tNdzSU7x
 fYTYtuvQvkr2aBnO/BSSuRD7eg==
X-Google-Smtp-Source: AMrXdXvBONRphu/IOhYxlFKyGySVwQAB6PjdJ4S/MaO6+PdZGJOQS4Vf2zGp9Dz+pTfYlrjHWqo7gA==
X-Received: by 2002:a17:906:3b01:b0:84d:4767:734 with SMTP id
 g1-20020a1709063b0100b0084d47670734mr47874459ejf.6.1674759676003; 
 Thu, 26 Jan 2023 11:01:16 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Jan 2023 21:00:59 +0200
Message-Id: <167475959087.3954305.17231782796910998330.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124203600.3488766-1-dmitry.baryshkov@linaro.org>
References: <20230124203600.3488766-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: properly handle the case of
 empty OPP table in dsi_mgr_bridge_mode_valid
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


On Tue, 24 Jan 2023 22:36:00 +0200, Dmitry Baryshkov wrote:
> It was left unnoticed during the review that even if there is no OPP
> table in device tree, one will be created by a call to the function
> devm_pm_opp_set_clkname(). This leads to dsi_mgr_bridge_mode_valid()
> rejecting all modes if DT contains no OPP table for the DSI host.
> 
> Rework dsi_mgr_bridge_mode_valid() to handle this case by actually
> checking that the table is populated with frequency entries before
> returning an error.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dsi: properly handle the case of empty OPP table in dsi_mgr_bridge_mode_valid
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2ec56b232b97

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
