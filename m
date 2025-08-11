Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7EAB20289
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 11:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B8110E2F0;
	Mon, 11 Aug 2025 09:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfYtt73T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A6810E3A9
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 09:02:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57AJxMET007974
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 09:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=; b=FfYtt73TZBF5+9/z
 qDBn8YF/XFOCvLK8+/qPa/2rX2ieN8UifIMXB6c0XGgtZc1uOHxrG9sMzXaVOTMW
 ODfXLj1cqgiE94V7Sea1ZRVhXpTDS/YT6vK+Yvf9qP58EoLphFNO4V/PM5YrTbWf
 FafAbgxCz2Qt8Yw7MP+UTHtXhHT+jMd/ERgqL2Zs9FTpY1iCxL63eu3dJfUX9Lvn
 ZNby5h2tNk1xx+IBNHTohCpm3kk82W7QcvKl6CL1SXR2Ar9b2D8DTx7Dlc4J1rRz
 koCBHRw1vEqu+UufFE7wk4xUFFporON534+10M3shJ38oZofnfetpOYD09MFP//G
 +w1TSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kpej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 09:02:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4af23fa7c0cso12196681cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 02:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754902970; x=1755507770;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=;
 b=i0pI6QSFuX1lSCKt1Qh8/Cob+7V33LmxrvuRekkOc9kwY+N9KDfkif0nT13AbZ7+aE
 9HlzBB0hlBx7TYeLPvuAF/MNXXTjYmWvz8Dwm5Xe1bTDH6cnUnb2wD09bcrCIPsoRWXw
 L5P+BFWQGOIJpNOXvpslRkcv9NvvHLj5ZY8WtHl+TrWcHtsWgFavO8mmo19pT0m4UzYh
 c4gnzjsUJ0FNARyhZHjLnh+MUTOg0E9YnzZGcXtdhKbFkLxjVi7a0gGWnRm/feDuYeRo
 ZYv7IsodCSFE2eOinLPSQ7Uigf6jiL7X5SUpORvGG/prIE7txJJsLk2wdzmn1qj9Cw1D
 0kiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPTIrWvm6XtaPHITIMJCUuiLngwpHa+hOKz6YIRE2lLtbqACGN7dGoxWgbCA9ygQ9GVJitUsboZZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb367kK3Gg6DF1428wEDgS76FIK6nZLouA+Sp7SYsiYHusbXul
 lcwiSv+7kl4L3v64S7SemePCnClqfip+8EGMgDJpeAoO69yIRfnTp5FBkUgvimmsbGc1ReqFSVZ
 GBmHnRqHPMxD6Xv5j69E01HsBHVru0jg3O5Bc3xpkTVGOj5ELhAvAhvxNe5f9G7eA6MhYiOs=
X-Gm-Gg: ASbGncuY0ptxb3k/yPgawueSGMbupOeO6pHKCmd+QDU+JPhZhZnWIwB/Y01qYSgdOPi
 Rsea58ps2uV9gyrGucEOXKkv2Ka4JEwljGE6zCA6lKkLoLTLqAMtdTZ66e7K7RVYu1OyFPD4IsF
 6lSSJy9QcLJhvwHrd7c+RVrmubaDuf55sqo6xOuiZH8sRbfloo9ma44L05U1+gNTFy0VCPHsEG4
 5zlgkbwx9fK2l80M7fvukGyPMZeTIzt4w3ffL91f+j03BgsNv+pKTX+Fg75rzDMTg90NF1NFhjU
 BgXAsX/rC7ndhRAOrkmyMdL+Oil4vjh5ybyNsPBNVsgzwvsqaAqFrcsStBdrbk8HQQWWoj7MYoa
 f/BVZkVdlw4rG7A73xg==
X-Received: by 2002:ac8:5d51:0:b0:4a9:9695:64c0 with SMTP id
 d75a77b69052e-4b0c1b28bf5mr48920921cf.8.1754902970279; 
 Mon, 11 Aug 2025 02:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5TWRviyLEMQPzvh4QVbqH5jPy1ZuqxzZtRDTRJ9JxfjUgmBuPx6tAaaAYzS0THJjvJINbNA==
X-Received: by 2002:ac8:5d51:0:b0:4a9:9695:64c0 with SMTP id
 d75a77b69052e-4b0c1b28bf5mr48920671cf.8.1754902969784; 
 Mon, 11 Aug 2025 02:02:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c0afsm1977783566b.117.2025.08.11.02.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 02:02:49 -0700 (PDT)
Message-ID: <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 11:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RiuNUghcuO-VBuPbA1HW2cLTCoIoRPdd
X-Proofpoint-ORIG-GUID: RiuNUghcuO-VBuPbA1HW2cLTCoIoRPdd
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899b1bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=aS93HcZ8ji4XsMPHnqgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfXyy2ngZaxax8T
 hImmPOchKUzC13YwMKJbGpqafbvDLN86F0hQ16saM7y6t9j2VOH4UCira/e0MLZticx0/iM3hPM
 VzNA5t/6VLfTGejvlyKe5eSN66y81AvnlsACniPtyLVEUsJTYQ50LEXr4gUp6udtwzo9BGTBSSK
 10qwqOYwMJFh6+3fbmP+KA5H8+6uWrAl75ejS4VQWWJoT7Imvk/MXzk/MmLHtKJFJQZoIo85ff8
 +4rqQhfM9Ff8F+NzXFzJ8hyYP/NiAg+18zAgK7fQOzUUtRO7jU5zzHP/eILvjFNfK16Lf93jIsu
 s1CLbvGWV7MtQBpCskiqs63DlaGJUBRmwWEB4eFa4V1FojY6+LKXpQvuT1+Z/nErNcWOQrLdOaa
 ElyZsajx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
> patch posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
