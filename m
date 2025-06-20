Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC89AE21DD
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 20:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC42F10EBB1;
	Fri, 20 Jun 2025 18:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qk8zULvM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3FA10EBAD
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KHcbmw027998
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CVc7A8xrMHlaIP4yJolGlsjNwADCMbUKZl/ABsd4jtk=; b=Qk8zULvMyRlrQu9v
 Sx2Or7V8X6C89vR74Y/LH3FGphJ+F/3IE2Mt7D57ZjK7y9CyrMb1Q4TdjjUoeN/O
 Pt6Oyekff1vNYFvcEwwcnSgb/nkWyNkTrZRC8qvuuS9dow6CfWqVyvC6I4B6/L24
 mIRUj6te82cSxJ4w1fd/pbgOZkwMJxYIX57hRiROW+7gU0nijDM+8QuZ/KMHWPRj
 oAVCHfnKmlQSZ+fDFS+g6dr5azg1peKZi63bxGvBeOSVd+4cfz6lPkqojQSLX0gH
 qHlDiSgKS22uWQnfQQWasRg/sw6/b5trBk/gdLRobsRb32azWi2gGGna+5lWrJgD
 jlbv/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dc72r27d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7cf6c53390eso171486185a.2
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443245; x=1751048045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVc7A8xrMHlaIP4yJolGlsjNwADCMbUKZl/ABsd4jtk=;
 b=gjlXToUP33a7M1dZb23wY0yMVUUemen4+Ey9xgFbIHGo1tANELIn8I+v/MIPmyeash
 cV/sDDjSfff1VWlnZfKmvzm/aIU3fRHKTMoC3592rvLOpUXeB+kV1aiKEOikvzfAi0PU
 eeGXXejc8ElLQ8aXrRtKAXcw65LHzDB6ReMrlLRH1CDfPsXF9w3Fyclg9hop+M1nTvET
 SzKFcjEIXoUWp26BCrLtrydusDZ+1Wz8DGBVmOpyruy3Blo4TqXY2u883brzFaBIrBc2
 benkQH/XMEvyveO8+/V6xXOPOihZwxyOcLvGj9zogGeluUQwj5wJLd1REeZ5p521SmZn
 z1lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhZNSJtrCMy1P9Ivfn0xfdTz/64KIl9UY32M6z9B9z+H79VyfOkov5Nm3QIjPmKC5IPrjEOyKIbDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFn+1q0rmZGPVJ+cYWuWY6pOLFDX1mRiIMHiaZqflNsCoG6GA/
 qIlQ7DNDN3cOaltaHTXLw/Rv7wwttuyRndTyfBIsJlVZV9MyHGEdUXFylYd+hxwN9WvEigZwCSw
 U7xAQl0VBq59uQhPjxgTVtF6TRNgbbrKHhCREzhTCsURowDb/ioOekp+hJAkl2OqpfQW4NpA=
X-Gm-Gg: ASbGncvsHzy4nO6d7Tz4c877ZqfnIOgAxBEUph3qHItbPOvWJ6zgH7evPhoFiCTBwo7
 c5LNU0yZlObH2UVbx7pxZfakJGBxa1nuSDYflxd/5oz0QfhLwaKtjJj7UhycwX8Vtkrn01Nrdk6
 TbDb7i5O81PKnwPetfJH9jUjS9Q9+vLXgosQjb8NDUrq5B7iO0JsZIGWBaApYvI29MI2CGrb4uj
 Ud0ZPeGKJplWLzTBdVLUbIXry7QGryJEuu6UyeZat+O4XLsd3G8k6ZLSWDPHdcpSTuUledAOvZR
 Weem/rAZFKA7jowF4GYQLnYfliNMpL/VasZjrFZH89xx5Bwfk2EJ/5yG7JA2M+BU00UPaWKtn3t
 RDSaU3phsiT0YPCMEn1qpUrvKrDWVVBsHCs8=
X-Received: by 2002:a05:620a:4707:b0:7d3:e8b4:3386 with SMTP id
 af79cd13be357-7d3f982d109mr467393885a.0.1750443244515; 
 Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYRug5gJS078hOPt3466yq98+p4r3R9GxsncNqHjb/+sLWrB1qjkQE/6D68L+cdn2aDAgI0A==
X-Received: by 2002:a05:620a:4707:b0:7d3:e8b4:3386 with SMTP id
 af79cd13be357-7d3f982d109mr467390685a.0.1750443244082; 
 Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:14:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
Date: Fri, 20 Jun 2025 21:13:53 +0300
Message-Id: <175044313809.2014621.13604308903491514079.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
References: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GNgIEvNK c=1 sm=1 tr=0 ts=6855a4ed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=yxMiGmJVoxqqM-PvpN8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: oKYT38NOLTUsVquQiPhjM43PI2534LUN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX3Go1o3HJj2r7
 hmEbrcpL2/V4iYTq/9Q/Zk8T8/GbE+MrGiLRsPIok6+1gtasRjjnUdBd0d8VIUnTQKP5Yl4i6sv
 ioG5a/m9A/gMn39BTidatvOavpVHm4c+9TxMBpNTf4w34YDdGled+QjFG5L8AyredUt+TmrNLFb
 VM1+HarW/F2lJcxjQKDo3l8LTX+5nKzr6FyTMlY77izAuiEGCyoUQ2TgEtDb6knFkteYDYHJ3qt
 N52mzbyM1oQtl7ZXsue70e3SMsTZtrtoNcPlW1osm6hcwOM/88MBJHUE1wjSij1uwChnpTDGEoL
 8foY3OuJS0395QuzPclXtfWqKmjq5kHR61bT1rx/OqWpIX1NC2LW7qI4dbq6JWlmpMGFUbxZAff
 th0bn0XBqWLRK3801sIJCYy0j1RaWqXTFn5HcXCBnS55o29xSlzNF0/CrAKqz1LzRcplUICF
X-Proofpoint-GUID: oKYT38NOLTUsVquQiPhjM43PI2534LUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=721 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200127
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


On Tue, 10 Jun 2025 14:50:03 +0200, Konrad Dybcio wrote:
> Based on the downstream release, predictably same value as for SM8150.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/457fad6dee5e

Best regards,
-- 
With best wishes
Dmitry

