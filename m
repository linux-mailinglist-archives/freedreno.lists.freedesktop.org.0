Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364A913883
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 09:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D49410E0E8;
	Sun, 23 Jun 2024 07:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nFMSECDN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DEF10E0D1
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:15 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ec4eefbaf1so20130861fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126853; x=1719731653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NdK+Z57kLe+iVSXD6oAbe65mu24X+W08m/s2wPEPRiY=;
 b=nFMSECDNy7DkyzQee/gNtesUMJBz2aAu5G3NoXSJvx9TcyI5ikVW6RGsu7j+os/FeV
 Rc4jtk45O4tDdIzyo+2p7RExpB5Ooql8zMImF5uEmvy8BSrpEfOQ2Rz2az3qdNdSB4q1
 3P1pvlgs/mAWJRm0M8NOLQShDf3225XlGUd7D/CRL5ODrg5sQk5oWwcMc13EF8TRpEIs
 RHAcsorVVKgjuWekHdv7EGLRIObliDaNL7+/4a7g/t/HbRsgiAnY5g2S5u3z2vZhPL96
 u12ell97l1/qFJsMc+wX7mazEuPdroMTAaKw5lhgIfZw8DK6TrR6oaaMfGh9oDkTPcWx
 DSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126853; x=1719731653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NdK+Z57kLe+iVSXD6oAbe65mu24X+W08m/s2wPEPRiY=;
 b=EwwFo0X2+qSyc8o9z3IyZf0kHXptSvIG+KrvAt7kr1xuqdYlB5cYbxw9cIwh6c3Mal
 Rec8CqEXKTXNhH9v6UrZGLknOsuudaJolwgLD8Gwvx1sOLJZcYaIL6ZYJOGtEnbCNKUa
 lwVXvb8CvBtvA9H139sPuwbXGB6/LtB1c6php0zHybvfZ4XM4E9eZmX4d6QHvOUHfGea
 8fTwzM6yQFpfB9gTV4L3tfQmGhpt1pFhi5LxcOcngJ4/P4SAyFLkhpUTnhqp+HLwhrEy
 Or+rrCzUz3iR2ra25OYxqHmI2uClhMhaBHl72gYZCTYPcwEE/mD/B3Er+6uFUWXBLzxF
 gw8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Q6K15VM8tppgXBjsuN5w9GOdkTbd1MJwp0jSO78FseDvkSUZjhCA4QHwplq37v/oYycXqMckAG5iVZ89plXAtznzg5Wo7S6aXMLOhvNk
X-Gm-Message-State: AOJu0Yw+FKDSWrM9h/mQ07uTjFq+lAsGNGAM19H9zogG8AuZSRH12XVM
 V9jkgQGqNFD4P4sQwqDszLEWgzJ+cLzLemanrSEDlEiGrKovnism+Y7Px5JMNMY=
X-Google-Smtp-Source: AGHT+IEKqxbvtWfQPSdbxyZOKoTKzOfta9UYAGWkjh4gPijepxo+y2Odys4DRzztDMFEyCfQKNkPDQ==
X-Received: by 2002:a05:651c:152:b0:2ec:5603:41a with SMTP id
 38308e7fff4ca-2ec5b36b266mr7424131fa.2.1719126852954; 
 Sun, 23 Jun 2024 00:14:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_rmccann@quicinc.com, konrad.dybcio@linaro.org,
 neil.armstrong@linaro.org, jonathan@marek.ca, swboyd@chromium.org,
 quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add MDSS and DPU support for QCOM SM7150 SoC
Date: Sun, 23 Jun 2024 10:14:04 +0300
Message-Id: <171912674297.840248.14141240302342567945.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614215855.82093-1-danila@jiaxyga.com>
References: <20240614215855.82093-1-danila@jiaxyga.com>
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


On Sat, 15 Jun 2024 00:58:51 +0300, Danila Tikhonov wrote:
> This series adds MDSS and DPU support for SM7150.
> 
> Changes in v3:
> - Swap DPU and MDSS patches (Krzysztof)
> - Add an explanation of the abbreviation DPU in patch 1 (Krzysztof)
> - Switch qseed3_1_4 on qseed3_2_4 in patch 2 (Dmitry)
> - Drop LM_4 and LM_5 in patch 2 (Dmitry)
> - Add Krzysztof's R-b tag to patch 1 and patch 3
> - Add Dmitry's R-b tag to patch 4
> - Link to v2:
> https://lore.kernel.org/all/20240612184336.11794-1-danila@jiaxyga.com/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display/msm: Add SM7150 DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/64e2f4cb27e7
[2/4] drm/msm/dpu: Add SM7150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/75079df919ef
[3/4] dt-bindings: display/msm: Add SM7150 MDSS
      https://gitlab.freedesktop.org/lumag/msm/-/commit/726eded12dd7
[4/4] drm/msm: mdss: Add SM7150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0f4786881281

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
