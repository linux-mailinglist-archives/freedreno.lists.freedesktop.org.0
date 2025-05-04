Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB995AA87C4
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8638510E2E1;
	Sun,  4 May 2025 16:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6XVvHgG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29410E2E8
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544CZ42a005190
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=; b=N6XVvHgGqVq3Z7nF
 Dp/qgyhEEixJjIPcyfF/FVcF3tF8iAb0lPBL4wN7eUcHf/9BPKZmPls3EXW7Ow8+
 DmXSjGiJXrvY8HkXyCLb4uXat8Jqaf88jwMilaK7aKcT/qH583+aO4h5U9h/R2Ra
 Drb0QYDMSb4YjcrUn93uJLVkpE8RoiEc3ow7FMXxFPkPeBckF2VmDi+V85hvuyiO
 fhqs4fRsyrVjmnCPB2GlLA8HnKzqAhFN3ZjfnhDeeI0G2Gl/WrgJ+EbgJ9uxoJh1
 r5Ys0wic3+ERFACI7yTsdSPwaUfOztpsF9r8KQRf7iehupnxHC5CaFLSp9o59ELu
 zARDPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakj342-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4853364ad97so46945611cf.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375234; x=1746980034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=;
 b=rJnejDZXeZMdi0tbIEVyAHbC0E80USV/1JGIqsFjYYiaHGAfEJ20mPMsbzOHY1XPM6
 GiEUGptKSEmj/Jf2XZogZayY4wmQn31nRXVx+XhylTeXUTu//FIB/4t54K9IqR45Cpdd
 TLIicyuXvs904QRCbuHtDbHSMBtkv/2/UGf5MNn+ES4EkdIWaCmvB7kKCCN1XCHzcmwg
 mcWxmqLmNZrZrt/jfjAyN5mJybPvZ9QvVj+KHXZYp+NCwvNBMT3xvWNoTYDa4pc0spbx
 Bhy0qBAc+F6W6BvD3MsIdVzzvHom43+RmCIlCsLESxp60tfvfXvskW7dLOa5pw/CxLij
 cwpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Jj5Xhovf3Hx3mq2wxMyrZWnrGveR4ZYUR46964JymP9UKsJs9w2Xyom9Otyc3Yxu4OrBZk87kA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/05R8MP0h4JD6jqMNYmqRvhEVctcVxbZ2OguBShUsexbFmR6d
 dliDF5TRHI7YwIgB3KuRzMajidTf2revU4sVNQ54hyIIM1FGl6Z9gxMi82dGaWQ9FqxO5F+6e/s
 tHvwxfCsj9QY0xQLwSk5JFvZWTzCTYrDOMdggfXYArJ8w10JOJcoyfKJhsnpHsKEhA9c=
X-Gm-Gg: ASbGncswQa2GJpAkmKPoW3zFVuF7Y0KXfliCu1L+uw8nQB8DEfqPLQ/2vInRpwuemTh
 kEZ720GVggeWRZRLRGOLBPaj2bxKEn1IMGoUQcTGK5jypHm9qXkmpEsk5x3LK30sGdufdyWy5IB
 o3zd1CcWVrulFEaqfQnvMQnx4Ddoo4jnSAyOPAcCY2EU6gtnoAiytQjiTZuTDjQH9bPvNk9FijO
 AJhuToBIin27k6tTxXn2OfwB3pYdxKfs3P1cUEQbPc6jWSBJBDV620fWOd2xTwjEekg8wgdj0vy
 7oD1df/TWE8aMJa6E4TPoWSoyKutc3j/DHGOhimqYOpgi7Zuu/osrEl+dWzYYAVwovzfMoBekdk
 OgyZDekoiuRoF04oEkZCsAujw
X-Received: by 2002:ac8:7f0d:0:b0:476:a895:7e82 with SMTP id
 d75a77b69052e-48e01552584mr75445901cf.50.1746375234606; 
 Sun, 04 May 2025 09:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhEOxFwHYPaRivE5KuBUUSrIQdtLUQdGkwtMO2jrXIxKo/JL2oOjaGV22aEcp+VehZmah9tA==
X-Received: by 2002:ac8:7f0d:0:b0:476:a895:7e82 with SMTP id
 d75a77b69052e-48e01552584mr75445631cf.50.1746375234338; 
 Sun, 04 May 2025 09:13:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, lumag@kernel.org,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Date: Sun,  4 May 2025 19:13:30 +0300
Message-Id: <174637445763.1385605.2171270817711925653.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX55aHYYmOHYhD
 Ejs7kaCKl0vA7Wea2NjhM0VjawRSI9P5LBnA5IA9sGD+b63loE7/CE3Mn9TTYKOsY5iKpH1BNvp
 cwpMvZMqfue6X8UPrUJqUmsNiIPFWeUnFDgM3ZHvLPq6e67KP8O9CQBNOGCHkl+OaTiaYUncwM4
 XdTsnN0pejYOCnwCPMn7aFuJ+ZsktVj1ZjbgYOvflIrGnD0+UDVLIrsRgcua2oUFoNiHDllCyG7
 pKrmv3vR6dWZgIOKF2IkskdozzJEeU4Hs7ar47c+8dFoExjYJ1DOagx+6U6CSUk1sGHTQ4IbNpn
 M3BqKvDtR2z5R3BBNJHiVrIiCWLCXd0GodClrkEpqIB5vG8wtFFajVycGF28L/lyNfttNZwreWm
 XWFnjQNkDqP94N09p0COo9ra/gtsOZ009OfQ3nU7Dba291XRZVIBZQZfG7bV2Sta4pD+u307
X-Proofpoint-ORIG-GUID: UCrsLr47OxVtOshlHgV4OjahVOp3jlDT
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68179243 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: UCrsLr47OxVtOshlHgV4OjahVOp3jlDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=816 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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


On Thu, 10 Apr 2025 10:52:21 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Convert comma to semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5db5401c2455

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
