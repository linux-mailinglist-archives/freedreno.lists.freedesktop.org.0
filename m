Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0730C7BCEAF
	for <lists+freedreno@lfdr.de>; Sun,  8 Oct 2023 16:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AD110E16B;
	Sun,  8 Oct 2023 14:01:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E71B10E16B
 for <freedreno@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:26 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c2907ff9fcso44268211fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773684; x=1697378484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrbe2OEAhJijEGyQK+85gEV7qQdJqrY99QKDYQ+rxHc=;
 b=HbJABJtLkyiPx9BL8jA12OjsAwofdcBK9Erel6/FFz2svhl+5H7i2JKdGCWyt1aCQX
 weKkh3KIeN98SblyVbJI0QPci0As+VdrobKCs/ctLnRDanWWf8KnQiVfOVrPDz29ufVi
 XUxhySKNkA+3tDIgGQgy2nc75LV4qWuFNgcUETnmUkfV3BSQE22yu05RbxUnR373NoMJ
 707VmI5Uk5Jlu3AC2cLSdNFj28E3gxgtDcJVR6z3GLRZbcJZxPh9PrjxGJXkGMvVlT5h
 T2kYrbjEWyQVUXY61C1a4APj/rdEH2DdKaKD7PIZ6bOoQm3D6qPn3CGiu/iWLNLLp2K5
 889A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773684; x=1697378484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrbe2OEAhJijEGyQK+85gEV7qQdJqrY99QKDYQ+rxHc=;
 b=MZvo2D+RK+PP3vLua8QTu4298kWWR8bHxaZd4aYnMZjcLZtXV15qWYwsp0kKpiHEsd
 VIhKWnsRsdTjJZbgznn44RRMVCNGS2056kvZCvnHrnvhsxfrOZVMI1A0YkXUlPh22y6N
 r8rfe0lrqaZUWN9vnIZgbUzgPezh5qd0DUqFhArClhRorY9lgwmiw9z/noEeeo0VUNfz
 e4rti5fgC8o0AqJEoKf9q9SR9KPTXREG+5CktprK5L5svu+MTIXfzs/NvU1WRquszbnb
 KA7hemaAH2NxEvEoFO1B81y8OKKmoGoIWph8jWORWJ+ZTVNEcKf9XkJ88WRp71RkLOp2
 QX0A==
X-Gm-Message-State: AOJu0Yzb58R9LB9UTVdiHAE0M4iG0xzyZzNb0bYvIUxB1Sh+Mn+teN2F
 QitJ9BP2GlukxYIcKm8ps8rjXA==
X-Google-Smtp-Source: AGHT+IGhX63ME4hP/QjxMFDzFKLGVSIH9lhaSoXMWQNHOUIpoqTqxSJVWPkVFp9aDX3v7yMASthgLQ==
X-Received: by 2002:a05:6512:2082:b0:503:2561:adbc with SMTP id
 t2-20020a056512208200b005032561adbcmr9582392lfr.64.1696773684439; 
 Sun, 08 Oct 2023 07:01:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Date: Sun,  8 Oct 2023 17:01:15 +0300
Message-Id: <169677306905.2570646.10307218692711830426.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901142034.580802-1-jani.nikula@intel.com>
References: <20230901142034.580802-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: skip validity check for DP CTS
 EDID checksum
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 01 Sep 2023 17:20:34 +0300, Jani Nikula wrote:
> The DP CTS test for EDID last block checksum expects the checksum for
> the last block, invalid or not. Skip the validity check.
> 
> For the most part (*), the EDIDs returned by drm_get_edid() will be
> valid anyway, and there's the CTS workaround to get the checksum for
> completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
> correct edid checksum after corrupted edid checksum read").
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: skip validity check for DP CTS EDID checksum
      https://gitlab.freedesktop.org/lumag/msm/-/commit/22e96e73182c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
