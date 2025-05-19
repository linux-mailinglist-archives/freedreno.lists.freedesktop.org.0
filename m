Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BCAABBB94
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 12:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D5A10E3FD;
	Mon, 19 May 2025 10:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ig9y+3xi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224B710E3F9
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7Gb04023174
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=; b=ig9y+3xisTAGYAk6
 vzrFHWsJKR4tpkHn2DzOLoE6ImBbdkCTD+gi/Wu33ekx2QgrCFy8tD8krC0PeWjO
 JQiTJhrGJVDXBKd4ovWXhOu4IG8nwfMNdxUQPu4c3/Y+uuIO202cOBXzNYMv60eM
 sswb+dRXLsXkItnc6fy/pT9S3y/K7VactxYjLizylaZ8Zm/jfzJRh04PPUXucW8f
 cLeg6T7mjYHnEmnV5rfXXjOpFCt5zYrI5esrTFX/qP8AzOH0CoLepCJbujmFYvsB
 VbynHpFVuryKGJ88YN4KC1NDzaRlds0rnJgq1sSrtJCMj+hhALrrYb25HbC/5iFZ
 qjPiFA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rn3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8df8d4585so5273056d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 03:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652326; x=1748257126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=;
 b=ABwFmTwSo0Pn8mc6jUTyUE+kyPswUJVofXjQ2jtbFTPIqhiOerHnvB60U27m65h0dt
 R54+PIIUN8WasvNONnNVc9/OsnkvPIrRu5dZ9DysRx3YjK1ZS80oxscsOpvLO7kCvng/
 koQ/Z9ZPKmRUv406Fpz5FQmhauW0lv7YguhDxl+v/6wscOcmIi/4POLMfw7MoVlpgVgj
 LPvapEiBamEprnpmqMsGc/aCT47ITbu5cz20Kf/WSrs6ETb00W6IGgKZ13KurwevrKDp
 yS8NUMOy57Q7utlLQR+50Q5O3Tozlz4oAT7ps8EVhkEnf1kcNVl04NQh2RZ/4/O92meF
 cPDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0poszC56cpdYoy4xlYW4vDWshC1RLJOFO1WHGFSUYV/Rk8Kp1w6NNlajpxRj2Mw3dzk6aYyMDwvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz7hKKu4kNYfDW23S0SqjsNzTNud6+fgpq0nN7VIFA9JDXbm9r
 KccrKyi1cHYDpk6h1QdXhMXYq8JSpFvx9G7jOWe85oQlId3UHm1Z5OTpp148f+PaKLafwcoYn8F
 ZZ2mKpstbcr166USe0cSzrBQUFe0+8c5/j3GEfm6TFo+Rq/j9ujBK8R4W28sHTthwLMZ0Pmo=
X-Gm-Gg: ASbGncvbpPT//KCwkfc+Uy5dzAOJWXq7ylvSkqt7dqjCyVdvhVvNVWPVSG/4B5CiL1F
 b1NHCvZeNerVeyzhWvHVFGrKUlLXMN5pfuak5dM757SMY0zECrN3olLhVEnN3DPOvxC68eTmhU3
 poPCsACO6skVfKFAXpmtLsByJCXmvkA31KaTopWQ+dXbnBjhRhab2WvqkHIwuCBMIjiYaUWUL7V
 SO5Z0/z0HPK2d1Zla/2f9VSMmnz3ad7o6HHdUvjYQfw39DLVU4jzLw08ph+z3E96nIG68v/SWR3
 ld9ag5ithCuGC00MbKfa2JTcbslnNMOTqhEuM15iEMN6pg9qQseer1GLvu86RHrQoQ/BTKNZ+1k
 FIng8jh4X8UmT0lH5YJ0KKwNi
X-Received: by 2002:a05:6214:c44:b0:6f5:3d00:48b7 with SMTP id
 6a1803df08f44-6f8b08f3e94mr177056386d6.41.1747652326289; 
 Mon, 19 May 2025 03:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJcAEu48QCPI3xLKvGvX0WyaLZgXZDfjvKNGszvjWv3n2dnBqxwTrw/HMaVSNLmCnqB1f7XA==
X-Received: by 2002:a05:6214:c44:b0:6f5:3d00:48b7 with SMTP id
 6a1803df08f44-6f8b08f3e94mr177056066d6.41.1747652325929; 
 Mon, 19 May 2025 03:58:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Mon, 19 May 2025 13:58:32 +0300
Message-Id: <174637445761.1385605.1655307242788912064.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX0OLL1uFr/DkF
 wYSgidogtcyLgrg14zDsnfq6dD9JS/PXSgWD6aCUdmvkX++ZI2Qg+syArDf1CAcZVTaWPsKN7ay
 6tcDkVdBerZgdWE0xNkD+WmvMEEQ/T5LRfWk095KCFkiRoc8xujujVdld3wLn33qvKvb2k2Mpj4
 tOk+UhN1um65xpUHdSKG1wWy8Iukllf3JJ/KHK4Di0zZhV6HGA+th4cECSoRQnBPIFHboMQZBdY
 wleKMA7vxSRFzP/TJCGExYFr0oj3XLC/xtTDLqjNXivroDgAbacOVzubExIU9b2iWrO90mT9C9N
 OQlnlcqaoA9T02Ah5OvmZclVqt8Quv1ZZaVBWAxjJefmlrbH9GycUFxqF11RweI1vXVSOmWGkWP
 HU9mFOToT5TpDNDvBn5cwQhJcix+7hzz4I4lNCsedurX+v8GnX/NiuLrApaLI/xMRcQFqJRG
X-Proofpoint-ORIG-GUID: hVt4xpr-U3qiUSKOq_wG-ziMVt1fCGis
X-Proofpoint-GUID: hVt4xpr-U3qiUSKOq_wG-ziMVt1fCGis
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b0ee7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sAmZ8rDWQjnllFzyCpMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=656 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103
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


On Fri, 25 Apr 2025 22:49:07 +0300, Dmitry Baryshkov wrote:
> It is easy to skip or ignore the fact that the default SSPP feature
> masks for SDM845+ don't include the SmartDMA bit (both during
> development and during the review stage).
> 
> Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
> SSPP feature masks to make it more explicit that using non-SmartDMA
> masks should not be an exception rather than the rule.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: enable SmartDMA on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a2343de0b6f
[2/5] drm/msm/dpu: enable SmartDMA on SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8dcccd7a156f
[3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63958b80c2c5
[4/5] drm/msm/dpu: enable SmartDMA on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3f5e910b33a3
[5/5] drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/79af56964ee5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
