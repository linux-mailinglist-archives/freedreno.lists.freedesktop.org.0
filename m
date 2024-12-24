Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB99FC252
	for <lists+freedreno@lfdr.de>; Tue, 24 Dec 2024 21:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B46710E4AD;
	Tue, 24 Dec 2024 20:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ar4yQcze";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC30410E4AD
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 20:42:17 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso6627257e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 12:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072876; x=1735677676; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQSshybI04o39qq+T0GEm735jU+JFiPrHVAMwlYy/aU=;
 b=Ar4yQcze/WT6AIFRpXcZVvpRTb/U4wXBp9yFQf+FhphLqxEPSoOh0N71CiXBC8zwH3
 MlkATpg6XicTQNiDVrfIaq0KAGg2I0Sy97Fizs4PVyt6RnKQ285k4INhgWmfCRm+uh09
 IC8hSXSmp7hqQlUg2IYVPfyOF8FFFIUkFcrsLVih8pC0oioY9B5FhOXiEwNp6Wq4GfNe
 qbVILFVOq/YHlpnl4lSUriWYSpyvU85/hwK5+u/fbwap2ko8u281OCuraJf8oLRK1LoD
 FU3EdnaYfQ0k4HfD9PlcAjowuvu++jk/CqOOKIWYk7TvCH3Mnhd9gzjDgjEBwDQasTOX
 /sEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072876; x=1735677676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQSshybI04o39qq+T0GEm735jU+JFiPrHVAMwlYy/aU=;
 b=erRzA+AhEpP/UDVZYC73eqMpZbpcFoCkKvbdqpN+yBYXkvAqEXqwd1/r6vpF76TN/o
 +aY3bWW/uqjTfr686yTigqJH1y0SM2cLbJYxFwJOj2/xGuceyr/C4iYetNm+h+X5+H8P
 2/NrJcYSx/MbrK9nS1WmmcgPCZZ5G0cSoWTOKd7NTqcCvMID+VdAA7NC+2DbhGlCjWDJ
 X74B+3FpPJErELPW8ASHrK/BlQ3usBAGxeLxx/1zrMx7Vb4napOt+3FDuPfaYbqN8A9k
 TPooXr6oUAzvcuEudx123nvDrPx+qWTnCguv7d0eU+F9Ewg2zJHztpIPeyR7oj6botmX
 VtEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpHjVhtnYD3QvT6KBTjy6skXdTQe2301kCWQ4xb1swh4NG1hrPaC6fB9xlJeqEBz4tKfEPCd8bIS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziSEaiVqR8RWW02MCNAkMBmZChWtEdj9zE6bFq7Y/0DQCiSkgp
 Tv0yqDv6CEFaxzlgOrA9YC2xOATkfDYK6c359Hxc6Qqyo+vt9CtfxlWpEcOWJIQ=
X-Gm-Gg: ASbGncss6Tdq3ZfXUMtEq4MmQD+JAkwToxZ3kNYMljgE4XBj5vFKV7800HHDT6V3DpP
 IbCaVD2JTpPwJkl3DFNckczmm0+lWlZnBf7cM1LtrzbwvU49nHu+EJfWcBv7ixcA4ZChT8u89SB
 GvcYOWtWqKtisQ0RRaUKWOk1dBXgXuZuGgAel0kbtctO5eDmeHKJpt6bqBAzjBhPLlROwOV2uHx
 GIpsfkIEPTxvnlTqo0xhqB+biOueYFPf2QFJ4KkLV+pj8zEk8M/1oaWzAZ5pDLlEtd8y0M9
X-Google-Smtp-Source: AGHT+IHIVDCWc9IlZCTWgDJg3QKU/MaMZhVCDsxC0gJPH5gx7lr82P2RIURz0tDa1+DSuu1PKX7gIw==
X-Received: by 2002:a05:6512:1394:b0:540:3561:666f with SMTP id
 2adb3069b0e04-54229533355mr5982889e87.20.1735072876384; 
 Tue, 24 Dec 2024 12:41:16 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] dt-bindings: msm/dp: add support for pixel clock to
 driver another stream
Date: Tue, 24 Dec 2024 22:41:02 +0200
Message-Id: <173507275850.561903.4817798700815205753.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
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


On Mon, 02 Dec 2024 19:31:38 -0800, Abhinav Kumar wrote:
> On some MSM chipsets, the display port controller is capable of supporting
> two streams. To drive the second stream, the pixel clock for the corresponding
> stream needs to be enabled. In order to add the bindings for the pixel clock
> for the second stream, fixup the documentation of some of the bindings to
> clarify exactly which stream they correspond to, then add the new bindings.
> 
> In addition, to help out with reviews for dp-controller bindings, add myself
> as the maintainter.
> 
> [...]

Applied, thanks!

[4/4] dt-bindings: display: msm: dp: update maintainer entry
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c36c60d1f742

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
