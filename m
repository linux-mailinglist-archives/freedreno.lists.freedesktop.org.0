Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB678711AC
	for <lists+freedreno@lfdr.de>; Tue,  5 Mar 2024 01:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34EA112777;
	Tue,  5 Mar 2024 00:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TL+t/wQG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1E9112776
 for <freedreno@lists.freedesktop.org>; Tue,  5 Mar 2024 00:28:13 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d204e102a9so53585231fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 04 Mar 2024 16:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709598491; x=1710203291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgihA/j9MMe4W3y4lHJTNEdOriPRYiwOGRsjM+J9mKU=;
 b=TL+t/wQGuPtp8XB6M16Ol2LF3G5ksparMUvhEzD8oGi0ZTUAexfjiBHEz6UvQS4sUb
 3IpqyAWXzY/z3Xi/P/tGNX9iW6fCw5YkUbFkWVwlicOHPoFL3+1LOpkmu35NyyqM7PDq
 WzNuqo0burCDuzCTdmOc2aiTTfm/1zseG/oPWWL1MzpuPr/Gy5eH1iWOwLBUr+IiNTKV
 m8tnhsh6ongzuD3pIe4QsBsEJT46hPL5F33Z8TdqQw+AFXTgcE1KJ82/FYsro0y1X5jw
 BFrPKwb5KoaY4k6s3pVDS1CoH8FcNfhvKVKLEZ0f/SyUluBmM+viktYdSSsW9Q9ijWwW
 16Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709598491; x=1710203291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgihA/j9MMe4W3y4lHJTNEdOriPRYiwOGRsjM+J9mKU=;
 b=OUtWexg8Ks1MGNAeZ/aY7YrxTdHQxu6S5znniXLKFQTkvAxHqP0w5iTd4+GUCDCA1o
 Rn18+dn3Gp/7vcgYVibwW4CKSR/JzcQi2FAHs72+v913wXFOsdQoNQlpttrkPbS44F1I
 01xMRDFiv8ODthFYsoTQGZtzd2yNpyEmGuS0kgdayOq8xMCNLycqbw/lhVaAPZQXGVmK
 /xEoCoNgDQgobEXFTOkDp3inDPmuOtN/+6sgHL5XHK0soHJhwTM/10/ZwH/pD9f+owe0
 hDM9ed3EfA5HRNTK0eA78Kf4JTnhc1YfKMVLVMr/OfEf73XHTLDSnFlK297/Y9Ejn7GG
 chCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBvv4MEldq2cABi2zwh2y2SfayVR3+D9O3dgykGariyL9bhFbyrNBezI4Sa91UIprBj8eMbKmW5kAkaPNXPF8pddySyNonZoTYZs9Bh53Q
X-Gm-Message-State: AOJu0YyWLPILLIaqP+sKW/qe+r2N+CNcYNqxen+4a0G884ZNBB1YMSYj
 PhSdc+cs9ZhAhPbdrHuF4b5EhSYMO7NDyY26Ok0mMIWAYx0+Fwpjr7KQpnO0Z88=
X-Google-Smtp-Source: AGHT+IFDZK6sfIEdXRUKSjRI7ZdugsypJRMtPgYmqMfgXbm1nTdG+dB8phMOK0N67CVLvFXHeQOFIw==
X-Received: by 2002:a05:6512:282c:b0:513:2c50:9644 with SMTP id
 cf44-20020a056512282c00b005132c509644mr257056lfb.12.1709598490724; 
 Mon, 04 Mar 2024 16:28:10 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 s15-20020ac2464f000000b005133d11b261sm1149416lfo.92.2024.03.04.16.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 16:28:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/msm/dpu: debug commit_done timeouts
Date: Tue,  5 Mar 2024 02:28:08 +0200
Message-Id: <170959846405.1203069.5519628464509979288.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
References: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
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


On Mon, 26 Feb 2024 04:27:58 +0200, Dmitry Baryshkov wrote:
> In order to debug commit_done timeouts ([1]) display the sticky bits of
> the CTL_FLUSH register and capture the devcore dump when the first such
> timeout occurs.
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/issues/33
> 
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: make "vblank timeout" more useful
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f1d0b196ff2e
[2/3] drm/msm/dpu: split dpu_encoder_wait_for_event into two functions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d72a3d35b7ef
[3/3] drm/msm/dpu: capture snapshot on the first commit_done timeout
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4be445f5b6b6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
