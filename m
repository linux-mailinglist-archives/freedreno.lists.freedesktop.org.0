Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270CC90C872
	for <lists+freedreno@lfdr.de>; Tue, 18 Jun 2024 13:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E166D10E629;
	Tue, 18 Jun 2024 11:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ic3G01ER";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E69210E211
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 11:08:31 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso6028297e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718708909; x=1719313709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rx8LaT2iJCWh9sAWiRO7uFEZyjt/OGNDwxdgEioegZI=;
 b=ic3G01ERieDDMx5VXCTJ9lWZHhibsewfLgnEluC2TBLXJX8eQc3VN+ZjbsAsBwvSsg
 spOXePCyE19CScBRDOSbd/n+hzsLypDdRN1WFf1g+Z6q84PkGSBagdzWf0cZZfdtWhso
 ZcMh26++fZGnIwlclLBJShrSeSoOlajqmI8gR6riMjImwesFMkd7Y+4Yg+OeejaOB8xP
 G/TEWRzeQxtPnARAqS2I/EB0EdgQlefbUsKINHlUNWek8+D2ekY+hfOk3YKxhYJPTZLc
 tj7wxuP+iq8liLP6pV3Ss1gEj4DYJrkDDtht6a3hXKOAURUNcuuyvXCVquGXwfL3x0UE
 4TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718708909; x=1719313709;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rx8LaT2iJCWh9sAWiRO7uFEZyjt/OGNDwxdgEioegZI=;
 b=Ykxapr+c10ehZMmP7vwrHsShG4Eu7Cd0ygONsqp4I1x555UOkOu3Gtnu0dnZemGi8Y
 ZMMnOCP2J9E/0qWZ8XB6ajy4XN5CHVuspdDruGc0uDJkzypQnFE+F5fHmFueqNP5xhnC
 Eh76Lkn+oK/EIPNGVcyXcGuwwbLnipzyyr0gb0iGuzr/9LhvlML47uLG2YO+xt7Na0XF
 2Jd0PdSJzEkLz43Zj6WTS1Fq7CHi9wIaOvFj97C6yW/DC9qY3003ZppBBrmUPZv0Ax4J
 QQhEosquVBU8BCxj/gvw2DbSM0RKQBSPzkUIw0sstz7WALzRPBh4v9Xul2OSj0xoOS78
 1D9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBTx6G0N/vQCoX3/h9vAQ9UZncdfZiRJybrpmJsoZg0SIASGAoHrHg8KTCNNoC8bHddsYLW6owIyQsUOwmKplIYGyq/eiSO6msrYM/faeI
X-Gm-Message-State: AOJu0Yz54OKtYo5S8TviTmGbbO8VeEXE22OGRkU0jE7AWViygfyum2Pv
 MUcOf+8d4wdTQeL21cwraE6takI2H3Bl47sJUhDlevuZ6yGIIZiAIOPoelNZ6LU=
X-Google-Smtp-Source: AGHT+IE8iLnoe7evxfTRQ3fUk5EMJX78UOkrfeDZUvup0x80fKNJfWmM6oYILoqiwu1riUTXQrFZ3g==
X-Received: by 2002:a19:f703:0:b0:51b:214c:5239 with SMTP id
 2adb3069b0e04-52ca6e9f465mr7402205e87.62.1718708909384; 
 Tue, 18 Jun 2024 04:08:29 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca288858asm1485694e87.289.2024.06.18.04.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:08:29 -0700 (PDT)
Message-ID: <f074d638-ac47-4324-84f7-b7723f18ba8b@linaro.org>
Date: Tue, 18 Jun 2024 13:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/msm/adreno: Split up giant device table
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-2-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
