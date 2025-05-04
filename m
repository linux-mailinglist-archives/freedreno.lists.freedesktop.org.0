Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BAEAA87BF
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C75E10E2D3;
	Sun,  4 May 2025 16:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZjDiq17";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694BC10E2DA
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5449urw0006852
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=aZjDiq17KIhl1ALW
 clqtbi+CIZdf2/GxD1LQVuQLnsOWSN3Sc2+Tb9lKmIKCJHaUzRLENzKHOXxRxdbl
 +kxerPxTRIiT3GSURePl27YOfEoeg4pjbKH4UPMLMbg+7lthLZLzPJOZRxyPk1rI
 cAahuifJ25pVkQ1EUSefDjPRMo/VGLRfE2bnUVYJBXHE6c7uw+LVaNwc1KvsRwXZ
 XfjjKcJ19EeqqmGm0FXFb1yiVvMVTLIF0Djo9VxBFjqZnFJjqCUxm8db39U9WkMd
 stwaAP2O6Jww1Sep7/uHuchriqAt+49mTUQRAZ4T4ofFk23M0XCxGNRZC/65P0cW
 G0btTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkt9b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5d608e703so696605085a.3
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375229; x=1746980029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
 b=JImmTpZxGNceABX9Xz2eKz1znm6vOp3hlbO3kc46NcsO5CxCMrJHaRkZNSTR6iMgKF
 g8LzxMY8fwTGDGkTUgWKJGFop+IaqPbh+dhIfr88MBniP9XO+UNo/s9Je0yetgjAhGdr
 gDgPqNy1MlP2nvbTCcWS4F/eQQJbYqfpfjpbdg7fR/XZ4SYAp8iEhYWd3JmNIuHZ7ANo
 F2+ufcgBn7XuJdoROX+kjEm0bMdMPZhsqCEBkjPMe6McGmikGg7NncR7+il0hx3tE+wD
 tUn/atRmk/CpxUJ5w/6w27kKHJ+5tQZo/c0Aa+Ven635ATov4JahX3E4jEvFSUxO6Jhk
 40UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3QRd+DN2hXwQYfSoN0gHa6jxfgjBdI1/w6oYcwNDQRp/qzAnots5Kzs6GHC4YS2L93B0FjfBCbQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj3iTpAXCXnXVo0j1hQMEloJxbWXk/CXTCJfipJzWp3tBN7Psq
 pMV5rAZjnVcxaXusXSPEdioJ3HOkEPj5/KJmC6AblvPtv8n5qxShpAu03ml6Ue98VAOVfemJRnh
 npy7ikANNG3FXv3QJD0wSw16JZdmQNCjQh+aAnSY6x//fmSTQwqV0HpQA8XZKLM0ZAro=
X-Gm-Gg: ASbGncs7ub4r5tdIhCeMa6qTXqrVqa9ZAPK9EYZamFfrQjXoi3S9llH30PGGyNZCRi1
 YL7VzrSUI8t00PY77BxrMEluZMUFnbDrIPbN0AeaQ4BKUc6+5svag67jcudCVuChavqoIUGSw4A
 +MQKSqUW6IESMLvflCmyQTR2+3vKMoIJcwlO8OSld/VWRg4+nq89j2CW8jKSMvTiOeTchcLY6MH
 suu//lP/fSJyhkfKbp7RF1RcMdgp5rhMigtyOw0Wc3aX/Ubpr2BKnzvV7JvUQdrv9jeVanpmkwu
 78ZbR0jArIq94wR/mB2vYE4CqPvBdo/f0TLleTzf7uROBxwEY4VUPfn4yLyo7a18t1QoxIscm9v
 6HmTsYgHHRUJR9nbg+4Tb7k//
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id
 af79cd13be357-7cae3a89beamr601651185a.5.1746375229638; 
 Sun, 04 May 2025 09:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOpfARWuH6M/BB8J4jIJ9/rRDdEqKJLyqrBgH4bY43WfHx9v+3pxeLlRyLuaD9LSQ7iLIxnA==
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id
 af79cd13be357-7cae3a89beamr601648985a.5.1746375229307; 
 Sun, 04 May 2025 09:13:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Sun,  4 May 2025 19:13:28 +0300
Message-Id: <174637445762.1385605.6437405000222393314.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXzfo4IA1HHwPw
 aZFKbg9yWWbf8Gk4hddxQGZXK9giOXAHM5GAwBz03E0yBcISEJ+35t7hxiQhrf2rDQnm3iOHec3
 jaF8mJF2odWSd2cwopiTgdgQiOtZrq4FCoW+D75Xj8m9osrsq5T9qV25mqPD/UY+ch9DiWD7Wp/
 uZD6evndq4jXmMWIu9Nx6EEbMotu6mVyQBVAM0aNlOHnSgrMUeqKHYQifCzVt2ZZ6jn6o9XKoUs
 W3bFm38j6OLV4qd6hg1211Gt0utMiYwCHdc4yO94h96zBEfcRaynHVukKUDWoZ/Ms9CtfDliYlv
 Am6tTIhn0aFldJQ6I+Rf0R8WKZ7CAYm9peRffHH5hRNpx/6laVu+oj34eeT4ReHn7w1RVHf8yIv
 DjfkBlg557INBNDq8LdzEZn3GMt3QlAalNeVXs52DWnpaQqiaUTiAu9XNaLnmfMhCTFtTN4I
X-Proofpoint-GUID: DLUo3AZQwZYkmkiPrbcBnW-otLRj3Sio
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6817923e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: DLUo3AZQwZYkmkiPrbcBnW-otLRj3Sio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=844 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[1/2] dt-bindings: msm: qcom,mdss: Document interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6694d17843e8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
