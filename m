Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02FACDBC96
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 10:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8A410E9A0;
	Wed, 24 Dec 2025 09:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="job63PWf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOC6WMYZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0774B10E9A0
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO7BGuO1056165
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S2+UgmRyHEzuY5//wHuUkLGw08i4UoAdo8wyqHy3q5o=; b=job63PWfTtQ5McWC
 HEohs2DAU44x4dqyNo8QzarFgReu+4PbIiWqb7M/xf8qjpKs9qY4bIaBTDjvRMdj
 XafvlHrI+lfDixfR55FnPkNlLqXH1rO6wVDOR5zvTsOUR+LI1AQVJAv+d+/vhwjg
 rzo7fbkoULyfLvV5fiU4AsfWlmNvAaqnSLk43T3dYfk7ANMsLUkB2GqWUvCpW/SP
 BsVjzp7a/nyP/uPqItiEj9DCWZMCz4xo/9NVh4RkmQWDysCn1RBk/ZG8UEGQrhhH
 CXJ1UMI9ypv73b5wWvqAxlqUkg/AL/l6kSjGU3NGbhgqdp8q1P/O0kqmGvWzu3UO
 FkKZcQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v20hg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f1dea13d34so131214671cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568467; x=1767173267;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2+UgmRyHEzuY5//wHuUkLGw08i4UoAdo8wyqHy3q5o=;
 b=HOC6WMYZY9vICgyPw49XASPugv1CCJhEJmunN2xjty+SQ1sfg/J1fULEmHXxailIxs
 htn430xmgv8kzGu+CsjoP43yZZjKFUDQ/Wsfa0LjDTwy9TTVdjENyGPUK3LeMbuTd8nk
 Ee9nkeOkOBsYvBXqBxRTSCLin1SZV24hzAWnS90PVV15xqgEVC1ZPFB/aGsOJyC+WRKb
 KEGcTI8Y8b4sXhwW22nM9OzjSAg+LQNI7L+SzkInNc8FRq4OTIL8autXKyG0SPqs7NUp
 i9w2XLSjpfJlqMFHMpcIwRj63ti/RiGFnweRxNNNNoUM677aRZuXkHTgvWriiRsI2cFs
 F0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568467; x=1767173267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S2+UgmRyHEzuY5//wHuUkLGw08i4UoAdo8wyqHy3q5o=;
 b=IXGadazNQWBhFvvNKotN8Y604O2qxZuzDb6Fs90svrem9JOq6qDnypjFYhAn+4bWlV
 1n4Zu4fFE5kdSh0bl/ZcnWwMMVBN9VodyH+JzcCpy22MNbiQwbWsgPTUrnVlSkUtU7lI
 8A9lDU3u8aWiOUzkOahYpXFSuqwDrZUFEavUAIDpOeAVC5JqjiYD1oQcrpFya0lOA2/n
 4wbb743ONDwzYVVQ6Cqc3VSyIJVaAlObj0rw09hnWzqxS2I2aV7faRw3pDrl+KwrxuVv
 fifgEoejTHTvIoVI9ajT4I61287sRaCuuvaL0+uH3zRq2ZEubMwRDlNBvVK89sc8IW5G
 HvXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmXFV6kO2FtoXMoAdYp17TFI1bBlnsTR+BDpR2Y6daAbDWWhQQok/CexXvnohYSVLSVQe6VR32v6c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNXpfB8xfPn8mzcYJUEJ6NSTCNiyP2xCbYaEgL9ndBxxbwDjPD
 WMXPI+WVPqHynOCq8ft993/E9C2FYE+YLX6TA0fDg9Lt/ErPxFc/ndiVEYFYA0Y34MohRoGRIFk
 pK9gh03DwpmXtBDBMWEzAPMnQmkilyyTW18SXHCAsSKAeylOM0PLUjKEEcMQSQ+06rUjrlSY=
X-Gm-Gg: AY/fxX7utWViR5pKvt1mqDnibirlKcU4zMmeDO4DzQDHME32qy4phcMX5HczkRT3yU1
 S0YncVSyzyCfUZofUUXWeaoWH3DOEVrsn7hycz4ZH0tnbITH+SpyneROVjpDXOc7YLqGjQzgbxc
 KJrPSf+SnInJyZ8FxBizYJWtBk8UnHVgQkSPEZ66QG2fEAAq7d6UcbWxbyzVubJeNNG2TR5CblS
 bBcQHFdo8JaRY5UzVehJrfeHj2D4LsSA+paMcvGUBbIhSzOr6LIoNytU4J2ApqCgM5UImwJIk0T
 b1A6+07YJ5xCCu828Ju2f6DhiKFLvW/VT9I8EhTN+LqB5hMbHRtzMBPOCxsYEBAWOo5CYIXRdzh
 fJlLyGagwcVRbigKGm8Ia/zVLTUpr30nvGdvDpfrqo4v6rXThRNCrBYT2JINYudhrSxQh/3Hmsh
 eTxarPU6BLq3tQqLRtSiDZJ8o=
X-Received: by 2002:a05:622a:1e19:b0:4f1:b93e:d4d8 with SMTP id
 d75a77b69052e-4f4abdb52a7mr242652111cf.71.1766568467395; 
 Wed, 24 Dec 2025 01:27:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIKNXajyePpJU7X8UHXbYrzTli0bpeChd2Z0MIo3yKFTwjZi7V2JxmdWBUX5NTuC3RQJFXcQ==
X-Received: by 2002:a05:622a:1e19:b0:4f1:b93e:d4d8 with SMTP id
 d75a77b69052e-4f4abdb52a7mr242651861cf.71.1766568466930; 
 Wed, 24 Dec 2025 01:27:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/msm/dpu: Revert broken parts of the quad pipe
 support
Date: Wed, 24 Dec 2025 11:27:43 +0200
Message-ID: <176656845705.3796981.11555430286508569316.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfXz0ZqCEd9+mdw
 ynTBc+rE2ZVaqC6C9fxAeg9a5mgv6G/WHHWAU/S1l0q61fvsz1N5s65ay6qe2b5v2mD2kaD5NSg
 Sq10hS/phZ0oBqy474E8xKI8zpkeghji4wA8wiagxb3uNs16Va+f1qd2k4WRmzf8Xf44kaNBta5
 KW89C2hom5vcRO/6ZF1mA5qEUoYYNN2bl63gr/QuTQ6vZcyNm3/BE15R2fSgEU2im86BPsUT6W2
 M7rELVkFumw0i2tdko22hCZiDx3qll8eHo+xnJMNy52l+bbjZvEr9IWkGYxsj0YiPfU2Ae2W4ct
 UyMiBEN3+sv79pLqueweAxi18nXeHW2Tmj+2tazRfOGzr0RlxHqesuCpa+/wr4IhbUkRbG9E7Ie
 ykF5PK8ZTBfZn+qGOZuRVOIWPmit8pLQxvVTbiFuqieEiH7o6wqk9i0mT5/je6gHtsGda8CBs1G
 iErUOoZ029fWnPqm1kw==
X-Proofpoint-ORIG-GUID: XWHzwD8DQhcESRwUHhRYgsjclpf15hi8
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bb214 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=97QjG1G37Icci1zzKCoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: XWHzwD8DQhcESRwUHhRYgsjclpf15hi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240080
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

On Fri, 19 Dec 2025 12:39:00 +0200, Abel Vesa wrote:
> There are quite a few reports off-list that, at least on Hamoa based
> devices, there are some IOMMU faults and some abnormal artifacts on eDP.
> These have been traced to the quad pipe support introduced in 6.19-rc1.
> 
> Meanwhile, Marijn reported some issues in some dual-DSI dual-DSC scenario.
> 
> Off-list discussion concluded into reverting these two commits to avoid
> the described issues.
> 
> [...]

Applied to msm-fixes, thanks!

[1/2] Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/35ab5123bd24
[2/2] Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/da9168d8ef1c

Best regards,
-- 
With best wishes
Dmitry


