Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D03A474AA
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C257910EA26;
	Thu, 27 Feb 2025 04:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kHvMsi0a";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F6A10EA26
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:38:09 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54943bb8006so477923e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631087; x=1741235887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NuhwZJbo550PrQsjB4y/he3bzDbUt6ahCDwi8PkPv8=;
 b=kHvMsi0aVYXxIW9YwgJtgEnVKHpdGIY+LqvynU6K5FASZ4HpmfTuLhndk8Qvpy7ArF
 fmL4pnPMBZePk0Zou2KkhhfhGqwUDwSJiJ2ZJowTF1oVXKWFwvTjYGN09WmkAnLYG/yB
 h+UOj+iFgUg7DtF7bFNKSYDVGlQPnuMMEGsNKwiqbwnb7tW9gxEniGKp9XkfKO1wQ+TP
 vyfoZ5zQOnx3XIvU/Q4bs0iRcAz6WXDUNJ6PF/aDtZlJxdSIelY5o7IAEWZwScqG2kln
 AGtRKVzwt60PxbW+W6XETXkArPNdeIJyA9JYLpQItUH1FdOKTNuoNSPErAf/Ka40ftNo
 vkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631087; x=1741235887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NuhwZJbo550PrQsjB4y/he3bzDbUt6ahCDwi8PkPv8=;
 b=Br3Yrps2vYbNH7iPQcqbVjTZBaFs9anA0JACBY3+kJB7NNC4GAiJ0SRXsGguNEngm7
 TE0Yu94x7o9YUtYSiyNmHb3CGX7ic/l+JpTPiN1KZhSNjXSklXX0smnTlb1sp4II4zGx
 rmOTA9/5CH3n+U87Kt+a+ECr+F0cl8hvcnOaSmGqZCpViaCu6Nwh2qPnnOHDfaOS44CX
 /mlpTihPHeyPY6MpMruxgp39k1dgdPp9TFk/zsa1A8oIT6WF7ldDpUGYs+WTbSYnr09U
 BOWRa3U33XxnopZPKwHyLdaPqxClOHixxw8T3t5fi3raM45BUJA8WRukauNAd4QsNEtj
 ekCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaCO2AxxAzn+tWOqAvARDahImQe9D6Vdz4pB0GTpeuLITYc1JBiF42Y0T835/reFxbZcj8IgS9QEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvD7O3ykiEtG5f7oZErMn8PHrZ+KZtmsbRTVhFyHnNRG0vAEos
 Ekrdir6a5U/6hFWpXyDrXaRRqKW3lsIX/Ibguem+nc2dls3j6qahB8vAZIcsAWM=
X-Gm-Gg: ASbGncs5NM4hrGS2oq/FL+wtobuFWci2b0QYcNkvY3GNR4Q1vl77Q6hbHF+yYXzzqyo
 YYSNN+bPDMkiV+Hp6MwYxvZPKYe2Mh0A32koafEBYFGFExq2WfOTAcx78Q0DPs3w5jH8QZlZy3B
 3xf3cjdGqI7EdjZUt6cMxRVpPgDeqfzb8PSnydr5AwhSNZv+YcyviytVdeNGV0i14RhiJdS8kAA
 CvKXH5Tx5VfAKMYZduHobWJQqFrifSTHm8HkV1Ajkn5CvVtRAtEJA6AOe6Un0TOBiOAnlyB8nwI
 sEXTC1wedcO5b9RGmhIPxSfiJht1BtMD9Hj1I2TKFg==
X-Google-Smtp-Source: AGHT+IGRIdnpgZp6aVSnIAMxXRNTRhCc98UJKotB+jjdDT229PrZTyGg2gjdq/20fQUotbRi1XPCKQ==
X-Received: by 2002:a05:6512:3f19:b0:545:81b:1510 with SMTP id
 2adb3069b0e04-548510ce665mr5171090e87.2.1740631087427; 
 Wed, 26 Feb 2025 20:38:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:38:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Fange Zhang <quic_fangez@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Li Liu <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Add writeback support for SM6150
Date: Thu, 27 Feb 2025 06:37:34 +0200
Message-Id: <174063096236.3733075.3181882897632312941.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114-add-writeback-support-for-sm6150-v2-1-d707b31aad5c@quicinc.com>
References: <20250114-add-writeback-support-for-sm6150-v2-1-d707b31aad5c@quicinc.com>
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


On Tue, 14 Jan 2025 16:55:24 +0800, Fange Zhang wrote:
> On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add writeback support for SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/23c0a9d36f78

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
