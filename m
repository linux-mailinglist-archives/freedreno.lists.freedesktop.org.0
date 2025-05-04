Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E1EAA87B9
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1B110E2CD;
	Sun,  4 May 2025 16:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTA9X857";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3B210E2CD
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FI6nx022383
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=; b=kTA9X857O4qZsmJA
 6y2rNIy9JrJ8GrF81eNoH58AnwJNaWPIBB1Q3dMByyCJNeOL5Sma4DJ9GG+g1Gnr
 cBIl1ZyZVs1j1guQmlWPODmhrfUmF+vYHk4rUkSWGFPa4FtPciVsHmRztZrAs1iq
 nMdNbqpxt0qbZLJ4SCwHx0YOOPeuIw7pgrcGgRhZy8GZAb2jRJGiomKmUNxmZWsi
 jLH0R20DZ/Zt+t/mAooQzIZ1I99RlVqfdYmhhT0Dy3IPcC8kaSBg8vkQSBs8VbvX
 4Ap1lb/kMycBkqrAZrI8WDIVxHFqaSltHWRdennRthYKtBrNwHW19tYiXPT8SGYh
 OhLqLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9a2ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-47699e92ab0so78133791cf.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375225; x=1746980025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=;
 b=ZQA/KR64sebQ8lYZP+UoAyeS0EALxNFpA6Uv68d4Q1wG5RnXs6uubrng6gKLlPZpdi
 E1aTMVrUMMM89zIqxjSOLmlqqcAQnhd/7AChco93eicDJ0RjB+s12Ljpf8gWW/fYHvjo
 Dr6V3PN6qY8i3ARU7OynOtz1xP5cwy9sOP4FJiWNE/II/CWe4YIjwSk3pxn89+iyth+d
 w0AwMKK1+hm01+1Pd5ThHS1x+/bUQpfzplFb4+S+be0wfpjg3IpvtCwT/9dXzlWgY90B
 16bO8k+bAW6BNjk7FKzaztg1TwbQAkYUMg5eVVGUxcDTXmFBgr1cGVKJ+Jq4cEJOHdSd
 q6Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHgD6UOhdNnfnSyAP78p1y6Rx/kwJVh/Kk7mNsQ1CN2LvLDqzeBcmImRi4IHeDOQOba4b7c32fZk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVHBjnNxltd0NLIAbavy2qsgX+KMToA/AnAhwtSNovF5V+2mET
 6wwt0IgHukOD94LxT+vYaQFkjwsmYoTsIct7MUtnDZGwLoKeiWj6Ri42Ij+Z5f+S3TDjSh3qY1t
 lfP98RERFSnFB46SQx9+yzbhtRUsMGYfcFfq22TOaI0NFiJildCmOpZ5/e9aFsniAI4s=
X-Gm-Gg: ASbGncuIQ1PqdXzG6gsejHHKWZXm3sztNVYsUhZ6BsMFvMxFOaAnNzugHAVRW+FTT1R
 SVanQ1wbx804P26mEV+UGZRwTXEeMirojIAO0voeEsbRlzeWzuId7D8pYYLG61mwKpRr6trzlHE
 QGVs47WbYDbRoI/zXJbeH3fMWGBT7As6FCUKHyfbTJeBiBf/R2TwRZYBz7+u+m7mMktwWBuzSNg
 +yfgRD4BZ36H81ZNJzR8I9+DlijEaqHfFJqiZkgufqZ2Gi1H9PEvrH7/MRJGhky/8f85PPoFivt
 csTqsWJCP1HTyqSvg0Dny4exv+nsMqp7WAegAJcEFOiW0oE5NEZ4TxSSLgyZPyOjrOQ11fYduOl
 my/pqPZ7rEAw7TarpERuiVJyV
X-Received: by 2002:a05:622a:1b8b:b0:47a:eade:95d3 with SMTP id
 d75a77b69052e-48e0115d91amr64684051cf.33.1746375225663; 
 Sun, 04 May 2025 09:13:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEodRLHLfsZWcNzptQvg9NDQY4Nk8aia4aLV5WiHHWopfrsacCXqFhOTDBmUdTbnXE8qdnXrw==
X-Received: by 2002:a05:622a:1b8b:b0:47a:eade:95d3 with SMTP id
 d75a77b69052e-48e0115d91amr64683641cf.33.1746375225283; 
 Sun, 04 May 2025 09:13:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
Date: Sun,  4 May 2025 19:13:26 +0300
Message-Id: <174637445761.1385605.4846218535199859363.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
References: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX5mldkBvqs5yq
 tlPBsY64D55F/jEz77oys1tETGmdVSSobV3az6SImoFwhxweuV7WsCKkErW43NIAWohgxHqT4M2
 vHEh0Vk1UF6QkewbFZccfuAK7XCZEeEUIA8cEezsczGWtlXeUudnAKKkml5+pIJ+Wr4TqXn6564
 myEnTJoFJ6SKWx86SWJI8dQmDYBfl5HAgT8j2xR3UOF08E9sKY2R6msfhsDvw2GqGsKrCGD4eIm
 2nPuN6wJ6KIqLlWy5ockCkWMzHOKbbMb0BqFOGUy3TENLGgEI5SWrj77LARardaGPojgC3NL6v2
 zZVR1T6nAdD3ewm6niOL5+KhYkFk3bjBfSpmDfxqhq1CTG39Qvf+AyPLM8nhmJJA0MVp8uqafbg
 OkUhKCxYs/uwh9J+fDqiGkw7OAStAiPFPGkUP9AuL5ozHMVb+g1QjMz6JTieO2Z0cd8hg6hu
X-Proofpoint-ORIG-GUID: N3wEpCRg9bDoo_yV8hFNcaHpNR-U0lf0
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6817923a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-ylb_1dp-gWGt-a8D6MA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: N3wEpCRg9bDoo_yV8hFNcaHpNR-U0lf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=603 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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


On Sat, 26 Apr 2025 07:51:17 +0300, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consecutive planes are considered.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: allow sharing SSPP between planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed12a3664b3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
