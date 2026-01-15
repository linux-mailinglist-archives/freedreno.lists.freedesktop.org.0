Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED358D289C9
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECE510E7C9;
	Thu, 15 Jan 2026 21:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZflvEuH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAvyZ7PF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DAF10E7C2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYIAX2174630
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 07FPw3PSZSCEYY7otxnkryfX7xi+qhEJ7PX6/evaCrI=; b=nZflvEuHnG3T/s8T
 25OY9rH7AXRGDVbq+yx3liJ/bat1DYItFGnvnUEEJ5mtA0EVo3ynsavQ3X/LNwuL
 UWV3kwuOyGfp2Y/57O9ZUlulPsmuvZ3BGDcbOX/5I2h9HUxeorUaYcfJgzUxktJI
 vUg0hhRt8LFTKbdePz2hrjtq5oeGTLuOVaSvMc95jot1PMMhM0UcMc91rTaeG6IT
 IVAaqLNiPLgsYOsDW65mz3vJq4XLt06u25AvPeL3VZyb9qy+TL27An2c8iEtsXms
 hcMc8e8b9ngsKLsgwxNTkMBr+YJW/4UMg+2hlVgHYq1ogD/xXMsjXSD0cJPOyQb0
 To8/ww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh97mn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-880501dcc67so49294686d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511156; x=1769115956;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07FPw3PSZSCEYY7otxnkryfX7xi+qhEJ7PX6/evaCrI=;
 b=NAvyZ7PFzjgAbEbMQ6FJkTq6oFGFuClqWYEcHrPSIETEjFvsN2HM4f+MXg1JTSUsCH
 guu6jJHjHFMqRFKFfcemHRKTtDy+qtTnPdCjFmNxgC/Cd3u36/deLsAlI4m00umvqoeS
 gTps8lULrWoJNWKtlsgX8xUe6QxYccPdgdlu0jIb6mq6RtGTR1AvvAU5MmGdE8TR/KfJ
 8W0zQuWpWkBVOZmtHeCZpqct/irdeEzxSa3IBCuDc/iYPmXI0IQsCiNiRJStp+IUEPjf
 FvPACWyoJGLI+Hp2hyuL4EY97y+W8N4UH4O90LlVpdwYoy/nhqP96NdbrGztCMXzCqnW
 hJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511156; x=1769115956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=07FPw3PSZSCEYY7otxnkryfX7xi+qhEJ7PX6/evaCrI=;
 b=bSm7ywx9F1ui8Rs7Od7qoCpoJxSGpMyDIPW9rBhdTZBGXOdEcxXLOMF91ldBqtCDvw
 PtF/sbZdLPmvXgVmoA5fyOluiDP0tTWWS338+pgSJQsEJ1EzgS/EzcjNAtsjVxSr0yFZ
 Yt/ER02YMO1ecD8n8okSKnRQ7/aoD4X0rBoM2l8YDCRDnQQqXB+CwgUrWYAwnROa2mOZ
 U0i+FZHc/TNjotdMCH/Xj8b29MbnzLhgl/96ifLhLHgOVtKzjHPtvUcZ7eEKrONGB/u4
 A8yDgy0VfHkFJvX5IbtmCdBLf15xWIEY58xHa+01vmQXSR3jSuI8608uBBxYc5+DBqPH
 4tBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyKZ5PTqmscAN6eRAJfwNj0KYzVO415ub/wyJ2qLZRSigj2PgfR/udy5s8FHH3xVX6U0OKhr77RWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzJ1L7yLhTdYKjous2KxWDwJ0hd7D9dzHA66bf3f3X3GvWieeO
 plYvSgjJvIJCkwQVHyltlbH9EsH/DdP8JpNVtJsYYUIn86noJkmlfd7PSKImCXiG4SY08n8Wsf9
 gG55thKVyAHCg8NekcuqfqPmzG+KPiJif3mvyeIxPAg0MINEX2AqyHhi7rlTwN8rthNoJGZQ=
X-Gm-Gg: AY/fxX74OpHm5edA3ZNj00gJfhJSMkNsVABQcmMPmXEBD4TMaQBD5FbiyLsE1LnECkv
 BSqKVTP59u9J4UVq6ES/kPZP+8tIsarjmFHuA2wX9pKWrTIihevTez6TV/mJmcNjTkwl7nyJgnE
 K9D+hPww+0KIy3CeG0ZAVvNT8BFLI8PfUi01x4aSddTd7TPmQ5ZUtsiEniQMPgI0HqLjBMoiMjc
 HnxkSrdyw13XJH8KOh8ymxFUJauK0KRoroOtadi/+PFYK8kLmgjzSHBYCREqQnqbcdiKqPPGUaU
 JAQFfMmoxpTACUpoa5YdBxw0/RcsywHf38w2egJlPDGUW5OWRlJdJQAcaAvo37gGGfkaV2/iXs9
 iG6vI5iM8QvzpgHA8PlYoPzIJorkMZ5Bn1mTZ/YBREx4fvj43RoVFHj5fwNpQKI83/bBB5EK4/4
 +Md6AZZRlRiPUNCQekvhD1+y0=
X-Received: by 2002:a05:620a:414d:b0:8b2:efe7:d82b with SMTP id
 af79cd13be357-8c6a68ec7e1mr102703885a.30.1768511155833; 
 Thu, 15 Jan 2026 13:05:55 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:8b2:efe7:d82b with SMTP id
 af79cd13be357-8c6a68ec7e1mr102699785a.30.1768511155382; 
 Thu, 15 Jan 2026 13:05:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Thu, 15 Jan 2026 23:05:52 +0200
Message-ID: <176851027322.3933285.5551205562887648299.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iiEW21WsS9ZkFLuLzhqJ1aSBLIr7zLoA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX+HqBig0IVSmM
 7U0E5PNiPDt1UjSKS4Q4NW2AQllOsMsms85xsZTuIruBc11Lh2e7CqBdTVmyRFqsXXbsSO159jG
 G198PfvH0pM1XrwIUpSmlerfP/x47ZK052pMq2D7U6agFsR13KZy/i9zuA1cTLEL61PqnMLL59R
 irYVMVCZSih/JQhm34zgVhUod9g5dgCrtKHPL/HjSJj5AKAqFbr20ZXuq5RaA7hlE9Qx/4krUdQ
 dBBLcFWB2R1Ja8Fkkg3tRwTvB/1fV1aCbzva7fi7HvD4y7LuM5MAhMB7434SQP8eNDnuLcm7cFi
 8Ns9Ky0KdrXqchNNqAN5aYMyz18seWIlkTa7LeHPDvfWm1eUKd1pU9TTE06jEvpN7/pj7kQ8NnK
 LyQxAzoHwE75dfv33F14MbsW26EJAHDy9OmmPPgGdAcQV9AoSNfc1ngbP3WPDU6XN0h1w0zND2Q
 H7mMu06yJw8Opf3h0xw==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=696956b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=MOX2AFg_143LD5mekm8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: iiEW21WsS9ZkFLuLzhqJ1aSBLIr7zLoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Sun, 28 Dec 2025 06:02:26 +0200, Dmitry Baryshkov wrote:
> Fix commands pannels support on DPU 3.x platforms and drop support for
> those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.
> 
> 

Applied to msm-next, thanks!

[1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4a8e3a34ea4
[2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      https://gitlab.freedesktop.org/lumag/msm/-/commit/59ca3d11f531
[3/3] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
      https://gitlab.freedesktop.org/lumag/msm/-/commit/23c39217d933

Best regards,
-- 
With best wishes
Dmitry


