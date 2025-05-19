Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49819ABBB9B
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 12:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2278A10E3EA;
	Mon, 19 May 2025 10:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofkjOmZE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3384510E404
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Pnt4015695
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=; b=ofkjOmZErSlLIt1d
 mCkbYMVN6TGC+Zeeyp/dr2vOSNDHi5I7gYcJ4gAq4tHof7zmYPf/F4bkCN55suW3
 J3wsTvqI51Br/tQ/yLNYFwBYY49E3FX6M011ogCt7V0fFUsW3oSE2g2L50UfoLgz
 8hNaw9OjXQANs8i2P7IgxiDYqXK6+GhLFmz7arXhtKvbNAhv+ccPDtGSOk8xIsyi
 H/ufduINiGxfqdaiAQEBb/0jbg5jWEI/Tu1x0sXE7CdsbWmhTOTsOdtSSttFbV5s
 6MMsK4noJhOoArE2iKWgOvtgxiqGaEAsJ3Y5IFRZCiWnvoCYVPk04YxG6d93OzAs
 c1AF9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkym6s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8b14d49a4so37020236d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652334; x=1748257134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=;
 b=TyNbOnKbDS709o7J4v53i9ivGwolOWCiY5TqoZMePJsb/ijft0nioDpWfmmLdupw3G
 GamjIeuRVm3qrUHTTKlEQQ0bqOtDyQVteogCt6+qGj6Zv9Qsa5bip/ZIjjem8OJedGz9
 izZjhgU0iKQOXMSUBjILPBjJ+xqdErHD8xnmWuKOlt4U0edJEaG31zFUcQd2g0lf/gfC
 cqpxl8jRyB4twKJA9tTaR5Q+o6T4YCBmEy+Bls3/8Jubftx1Kd8gsDJQS6MRKUeERnPH
 SxcxG0bxWohw9I8S8kVn/UEVwHQIPxC9t0zrs4BNG7l9sP4gzdxKoLITW0XgRKZe3ANK
 YFzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoMKipwHfZrfJ+ty0OxFu/WHGAUYS050TIZT+SpsCqdjcHWt3mmOQ2Sp9S47b4eUf/+xz5cvlcPPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza0uK4o4BdCSsm3gLKOvCnp77z/dBLOXhNllgg02zrGcb8/oVy
 KN0M4dXc0GspjHOb1IIQu1n+lvpVd5AXzeH5UqrrxIsYzjMt4CuInGQIgkXPWGiimNe/w6RHEU1
 Rs6EVaujAHqezSiIjvB2rzSkqPp30tl76K84cfQcNrw1mvEa/evO090MeLKMezKlNBn6Yzn0=
X-Gm-Gg: ASbGncs4stgnYYqxk2i8kmHRKXCY80BPlaxgdEmDB+q5aIDNAjYWoATLEnXebdtcKmY
 TKJTBJgKdAFrMBZQxZ0UbmoBvpWviiHDdIUyFBbHkSlB0KAuVNEq7uBIo51n3vmyVO2HdoMjqKX
 jfMp/uD6oVu2zdbTQw/l/MfUdlYgTOKXPWVb5teoZr2hx2gYLBCbhbtsMl7sCZT/DeEEQGB+Dd2
 I9gedNhi0OfO4gk4Lul4CgfJNUvTP22XYshOWILR4hreFGIHK0oY7p7EAm8GanQgVPiHGmh84wQ
 TJr1dQH7iIflxud/LQeo0O2XnGTTUwmwiwxZIk+Lh+7epI0JrkbcF2fuNKIvf/ryPj5pW2w+Hu9
 gZrzzXNbHmcs+XWgxcIAVoW49
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id
 6a1803df08f44-6f8b094f396mr220669936d6.38.1747652334332; 
 Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9NmA4hTkaWiWt1DG/4qc7GE2Tx99AjTx/JlvVe7S5Gwt2EQWgtvBoTnNLcaq/78n2BYfQyQ==
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id
 6a1803df08f44-6f8b094f396mr220669566d6.38.1747652333886; 
 Mon, 19 May 2025 03:58:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:52 -0700 (PDT)
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
Date: Mon, 19 May 2025 13:58:37 +0300
Message-Id: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WLmbW9wcWCXSM1emLIzI53kkQSKXM3up
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX/MPgTo1Zyt3l
 /bgwqZyUkKC3L4l3jbG3di1xDEmCFciQUrftcNFicR4qNbQeNHi+oWa3qGua52eF6/kDapoc9QT
 STfEF+EM8WaXidHQ0RAcDxfIB06ll3OJ0Hj5jqiXgzc3yPR59t+xCoTeRJL0eWvXaW1NuE3CVK6
 OTOfJpKyPcka4qfxkW/CXJlVoYSNkzswNUmzTY+O43hysvAbJFzmEubHBZ+p4rpgk62ZeeMOdLv
 tZ2Qhx43VLao4t/XdSxmksg18X3hobwwwQ6ap8ok/BxRZEfgHfHbzpl90dUDu5CfZ8YBQL6DRFE
 0rgDJieeoqACi9wzl0V+3JQK/29ahYoHCty8qQHs/7l64Yi9EibvA+rSZEgCGNSAx4teGo66fy2
 853qiNKeU3yxnEWxyH2s7iTT1iqubIN0c7gMKYVyxwLch2y1oY+2hoOCpTobsHRfYfpCnzpO
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b0eef cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AprTATsQUE9CPNEuHX8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: WLmbW9wcWCXSM1emLIzI53kkQSKXM3up
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=845 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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
