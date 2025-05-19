Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF2ABBBAA
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 12:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCFD10E3FA;
	Mon, 19 May 2025 10:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAbFS1rh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB46A10E3C1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9iulE022833
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=; b=BAbFS1rhNBHKavJV
 qSL8Xi0XQedgmHLHnjQrAA2mpxyN+8g7vZjXqbAyTUQVko1fCGAwMRQUMGT2x5zE
 h3QJhpKHYYVE505gslaJSZ75Yrm+Rr4o260q/lhhut4d7tjdX9K+J7SyAZc3tz+R
 9D5ludfSKKSxvQ3fOT9tNFAVJYvh4cLu+ElW95pVo5WAZtBuzWjSVFbL5g+IyvXi
 IEYaBr6jkSYf/aWoKx79L0tJjpJ4YINTa0xxqrqilhYmdBksto4j7a/Qi2xHuSiF
 SeiMFoCkzONe6ic+gM0S1MJwNQ6DIUBm2lSZc65ynOUYQlPFQdzuBA+YxNU828Xd
 QUiUXQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d06r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f50edda19eso66461326d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 03:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652338; x=1748257138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=;
 b=SokYdEz6/k6Xl5Fvy8QrNBPYScvdEbi7oxG0P2x0xFfgkFYy8xdJ//VDG3y/G9jvnM
 rVZS7tH6ZHUS+Zih5VqwV7WszINF7iUqY2AZpF45vdGHpeo+KrOPJoHyDkQtvY3sCiTf
 RHwwkpZw+mf7WyrQ8EMVmsV0mD5ZR46y8bztRuVfsEWNXQuNZba+UYWSyav/Y52XFdCj
 Tofxug9ydWHBUfka7vY0VThZ26/iEA1yXzQsqsDgzdN0Bs/vIVabvhiZKBhwcJAj/pi+
 awpXQWDqH5tCt1KXC/Q1m1EMBcECEqNFzBeH+X93pxzrDuK4+NUsrdYGPmoMX9EvJCy1
 wCyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7/g3B0ban5xglg92lAEcDP2DkygyLEaxwllBx8+nY4+8NwOg9sABtxg08B4xzGy05XahjULo5ZWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO99GJImKw9V9OTJlxacq3AybeN1szPmg+6LjuPFMyJJixGd81
 WfzzpyLuPOLqav031Twn3P7QS7qAn6qEfpZHu7Jc1Tt5D/Fac3MsWv2vNoe7DYVfkJM1sVg0d+w
 imCI4GfWlcB7/3kvPuuYJozLp2mQUEpjfeUPMzbIauJDA+oyIjcxFkznBAO9fdLM6T3IytnA=
X-Gm-Gg: ASbGncswpJk4234B0zPU4V0rTfE2DbJRK7o7sSmS8ZkdxdXlrHZE/pagT4mNrq12ePM
 KMWMHFbBg4gtVnRiKkcV9Z8RpVM6BGJG8PhoBljT1lBgukSdNuNV4SYXTiUETEv8fj4vWjDHPOU
 hRURnUODyDdAI4Y7BRuGulG73P9O5U0O2w4oDhJSQSox7jQ3AGfq/igYU8+LBPFAArMFISoZWvK
 J2Lh0JYTOs/hTlDH2kWAb4c7sMzQSR1Jsi3e3w0sAxuzvKPW8kbGU1knCVqZFo55B62zvg8qULI
 9HN1OPoh10hv9gnMx6ZpB2jj5+QE1uvT/wgD3jyumXHBTnd0Qd1o5z2RMxYN1M2ZaSb6R7K2cj5
 n0JpXYQLHKr5uK2rI/CAgHVVZ
X-Received: by 2002:a05:6214:2403:b0:6f5:421b:623c with SMTP id
 6a1803df08f44-6f8b08c007amr242240496d6.25.1747652337407; 
 Mon, 19 May 2025 03:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5bupC0i5Ur09/y0jWLEVLMby3ucut88EMhL3xZ/vKxRnjyojUQBjAnzwYO5Ao3ovyMv0MKQ==
X-Received: by 2002:a05:6214:2403:b0:6f5:421b:623c with SMTP id
 6a1803df08f44-6f8b08c007amr242240186d6.25.1747652336691; 
 Mon, 19 May 2025 03:58:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0
 platforms
Date: Mon, 19 May 2025 13:58:39 +0300
Message-Id: <174637445763.1385605.3424290525961139531.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX4pAvmq3x25VD
 lxsS/2aGfzdHBaRotzScX9lSGE7UY9b6pCrjJ562UWX5R7wNi0IsfAOJ//lFlZ2tr6UnJN0Spt9
 UEM0pOXo9yB1MpZnKSzqA/Vg5hJWClai2p1dTl5Zle8ax6f6XmA4nCAy37nIX92Hc898a7zxutZ
 y1aooP3ZLMRMuBqg3NgK1Y9A0od4wrhQj6IqlnMa1LZ+it0rnk5+RlTnz8sIFfQiqFqYTNhnx+b
 yAjLLn82vLAC7E7ATY50oA1a5wc6XIOotGsK6ZrH8YXwottqNLPcOE8rEzUxGdve5kG3MlCBmbR
 SSy91M6cbJv7rEcJ/Hr8dAZaKN46XIHx6ZFv4k2l/lb1nZKmYj75+NM8P8+a6RrToG2f3B9bFac
 wlhSGvTDrmYvsYxsbHsPqh4cyta7fhhrXC3RqaTSpYCnkbDwqo8J2YZWfpE/epu4efoixqpC
X-Proofpoint-GUID: jIaBrkHvkF6KZhfRyhRuJnXc_IATUaOx
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b0ef3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=eF9K9vx12itGwMwpEy0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: jIaBrkHvkF6KZhfRyhRuJnXc_IATUaOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=805 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
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


On Fri, 07 Mar 2025 08:24:48 +0200, Dmitry Baryshkov wrote:
> Since version 5.0 the DPU got an improved way of handling multi-output
> configurations. It is now possible to program all pending changes
> through a single CTL and flush everything at the same time.
> 
> Implement corresponding changes in the DPU driver.
> 
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ef595c04e843
[2/8] drm/msm/dpu: program master INTF value
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a013b60cf44
[3/8] drm/msm/dpu: pass master interface to CTL configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/696707d3d22c
[4/8] drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/df99bdfcb2d5
[5/8] drm/msm/dpu: don't select single flush for active CTL blocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e93eee524bb7
[6/8] drm/msm/dpu: allocate single CTL for DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c1824a7992da
[7/8] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a2649952f66e
[8/8] drm/msm/dpu: drop now-unused condition for has_legacy_ctls
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1fb28a8a984e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
