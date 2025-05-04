Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93077AA87BB
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9D510E2CE;
	Sun,  4 May 2025 16:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p61HPtGl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAB310E2D7
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FK2cs002951
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=; b=p61HPtGlIeEUxjqo
 ybywT5R1PFpAyKPZrQFAiTzHEkkKv0mRm11o7LyHDiys31qJI/nQ45V0w0HEnLwx
 Jc/K2zT6KjvWz7OkhlHVloBS6Q69jmEjaxNIa8wxcMzaGwNE2cpfjF74yleafYys
 2H9n+GA4P3pB8MclK5INKPmMr+tVT+rJ7IDT4wZ586o5OyAjnulK0p0Gpok7jnwZ
 Zohh2mA8Gb//nS99mU5BcKvJKYO8aPujBAaiE1DVjYrvTegcOHS0+jMi7BlIcM+x
 vpIhZlTndetVnqAp3JWyG4pCb4vL60Zq/D9OsRhtacCzexQSUTUiJi89EHyazPXD
 JLDw0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rt82g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so354266685a.1
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375227; x=1746980027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=;
 b=l/kuDwLhwX3mdw7Q+B809c5fiHBfG4/6sAT3tRilkjO2BORaXcE+zn4mn42ZN5XLnz
 +1AhVCslFaBjSjCUHtyk8Ug5P9M4odJ10NgcocBK9i8pcD+f3ts7oozKNOeBB4UeHgj6
 p6CgyVktUh4s/FqqF7vnVmImUNsgyAILK2tNNIrLsbEI9fB8qjWcs1QGosTa3Aium62S
 qaBOm8wOSMeUcVQ8P24BPNjHmL3RNJzOyhvA760nH35a2q8QvBlH/fNciJmGHVTM3BiX
 FHEO5mIbs95SK5QEwP08Ce6VACTYjXPjxqzvIWkb7v4lNaExRnr7qALBkD8Kh5+gpEhk
 hH7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVMRQCimGCWRFxb5Ep21bfw2W+S2ZqqQD4K1VAIwUey+rUsJFCqcMhfiApW+6p2Xr29ph8JAfp7a4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8LEHBScF79iX48a6TFqda16vyd0iowiRUVxYqjsRxDT7NaKxg
 YJxpagvFtIZWIVlO2mlEfzYMvO0nUz2lRZf3xKd1cHgzSHn8taiNOQi0yUkZ6zmbnGlZ/cs/PBz
 is96hOAINt27QwT6/CDGhTXc2fDyR3UOFUGthPnhVJximYkRuR9L5bEJyKNSNB6VzkHw=
X-Gm-Gg: ASbGncvVe6l3Ge2eO6ngeSuOK2G61KbvzPcj3cl+alx0FZMU1BfcuaFtsYUJp9pEqGV
 G90pMC53JfEUfp6g7iTI3Lv/bSjfhD/BvphNREcwrW/RVDPMQ7gl6+r3AaxaqosGdE7x1QFNlGk
 JG2/wmODg/rvV8+YgMvkTsljnbbJP6uwsa6i2pjNOdqvXvw7bAbKjg4F5iJYUEe7BGQZkOQYlOM
 UvF/ozBVQtjG+K+d0K10IMl+7i3fr5bGlxqCcPuWS+wOPY6vV/O6wQ+DAg9gka5Sw69iz+GF00T
 rx1a1Mfuy3s4R3mCMVmelx0kZQu4N2cIN1DZrYFn+x4IUC47JH2+MEFA/yXdt8Dn6O+yh7BKoeY
 ccLK4IZdncEO+IAjXVvyazfL4
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id
 af79cd13be357-7cae3a883afmr521804985a.8.1746375227104; 
 Sun, 04 May 2025 09:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWfqVRImHTF2hlg2i8dPTXb3VY+dorTtSOXnHwH9+M7i4F2YAepO0JanfpdKI8BQ8brOlCnQ==
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id
 af79cd13be357-7cae3a883afmr521800685a.8.1746375226766; 
 Sun, 04 May 2025 09:13:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
Date: Sun,  4 May 2025 19:13:27 +0300
Message-Id: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pUK_r8Wy4A51n3sm9sGoCMBrjdthpUsi
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6817923c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AprTATsQUE9CPNEuHX8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: pUK_r8Wy4A51n3sm9sGoCMBrjdthpUsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX4MTGai/D/v/q
 fK+Jqa70/Hgef/OrxL2Bqc3LGbROU5/u1i+y97K3cwhdk62TN1qZ8KzAHWQ6/Y2jFVhBtuWz9qe
 5dLxrocx2TvTRaFbgagrDikTgZ50pejltoBxvk1dFwsFAU9w6rHOfhOG+4tYt9K8iFJbT127o4e
 RJvdKYr2SjwHcJpYh3c2+CBCejZPzd8bjZmo5xew9BpV+6neRgRFPcdbYloJrFvsNfO2Z3a7d2I
 R3KopajXZonEmvcOSsOrtLMeP0+rxRr+fjS09BBYB845tEn9T1O9df/Bz1LnweMQ9yzXbgQtEur
 z2lhv2H1twTQXg3/S0a/6dimOsg3kVqeg35jXR0JecGx2xYZI/4BL4j3AxrKWjMYC4aZdq9AeXZ
 tzm0+bkb4dN0W/f14vm/Qyozzj28+IvKp6ThJG/fTnHJDHFxrQ1MSAy/yZ4TPDVPrM6MO/kG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=833
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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


On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> A set of not quite related bindings warnings fixes.
> 
> 

Applied, thanks!

[02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
