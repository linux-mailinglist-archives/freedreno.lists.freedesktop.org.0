Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89778B3F7B
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E6610F58F;
	Fri, 26 Apr 2024 18:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zyDUKVjz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A444D10EEC4
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:38:56 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-de59daab3f3so1811966276.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714156735; x=1714761535; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gv1XMYqj7FlbfLTbilE5kRRG0y9JWfghI0WKM8XxsyY=;
 b=zyDUKVjzmS+etXdw0JRZ9jT/NdvLDAvYHmjUonQ8SJpkj4ovJvnszFoxzBi3J06/sT
 /FqOt8Ih1a81cLbU+KecCaqGUDNI2dW2fWScHpaeoQSJORZ7d6/UmLCfr3FtX6y98vFA
 cmlwXtdrrOuTtD0DGxDxM9z8ZpTcY9k5/H3UJRqbWnKYzYWRuym0Ftz2YGwnDutbAVsg
 +pCWCPS0weJPV3A/h3N+OVNHOPxJ/tXrsuyd/oHsIxAIcS/CfcnlhWf0do7R3g8ZZ7xe
 KlX1EwpDIZ5Mud9dzd8rUErx5hTfZxalUn2qRpSA2OA/Xvkow+9LwUcTcC2LW7SLKrbA
 tKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714156735; x=1714761535;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gv1XMYqj7FlbfLTbilE5kRRG0y9JWfghI0WKM8XxsyY=;
 b=Wz4woLQ13J7WJP/GsIUk4KePTG/gvrERbEo9YNTJVvE9Fn/feQGga7YcanlrZq8ylh
 ob0+Nl7R/oX9h0OdHsXee0oMJXKryqdtk8y+xXMyYAaVmcPznbQmAonGrW1dVxM4hsfM
 ttO3PWr+yU9Im/GpPFiJ2A2unB3f1n1gz+1tdpfGbbZEVqgs3sPuVJB9W6m1LGvMbvpP
 K6zCrJUX55rfbc4Uu+Lif6vJlr2vw5NVdSAO9qS+W0wHTl5lCkpcMAiS5d2a/ctrm1nF
 joH9doU/Q1ULgHXBlVGWfUIZdD+fTrTSsVEpQubU+MUwhXWxU6UrqMLy0sVeGZEHWidv
 RcvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjH3sx2IPog8YbH0hbqzRNCde8r4gyclnOtrDR+BhT8s1H6Tms7VtejRhNCnPDi5E+sLCrZ6ZbvEpBzRdUiYFCVKPM+SnefO73h+z9Rlym
X-Gm-Message-State: AOJu0YzYQUAo12sh35V3HApefb55x6ALcZ3Q30k3rB6wLNAYroEgppvL
 TBJVjkQbYmWb8MQ5k6TUoYwtxEgq6/7KUWzLhDd1PEsMwlMhPRxjivoFjiT6lYICFyhr78+HPeh
 F9KTlw3j6ZQESMM5QNtRz87tJL6R316zI1gpIxw==
X-Google-Smtp-Source: AGHT+IG3IsyEOycBc7qulLoEu9IiRmWCqVyqNrLDpmeg9cQ457zZD8N3srGvP0qs68zCmdPTZI0p/dKAsd7wuoQG5rc=
X-Received: by 2002:a25:83c6:0:b0:dcc:6d85:586a with SMTP id
 v6-20020a2583c6000000b00dcc6d85586amr3741728ybm.49.1714156735527; Fri, 26 Apr
 2024 11:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-3-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-3-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:38:44 +0300
Message-ID: <CAA8EJppoK4XAt1ARugvKvW2mYjuRJcuvJ-bhFh+cQMr3zmvx_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/msm: Update a6xx registers
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> Update to mesa commit ff155f46a33 ("freedreno/a7xx: Register updates
> from kgsl").
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 ++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
