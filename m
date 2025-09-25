Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34528BA1B43
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 23:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7B410E9BA;
	Thu, 25 Sep 2025 21:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpaBbqkK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A59410E9BA
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:55:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPhEX011408
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=a4ka2QLj2dY6T1dJyHEA3YJ/
 IzOlBv0wCYfphXRfYzY=; b=SpaBbqkKOy16rASA7DbdkbFw3KD6rcnU0gSxUHUF
 lY/Q8ztIO9imzJT/UI0c7DxYFgUtMxMUa3zjSpivmlL/bSpUZECRbouC6DOA4NL/
 de9raH2ZzvwUBijW9Ss3lHS62mUtu3g7pCsSoJV8Wu1yAcbaJL0/iO6Nbqm6Z5n0
 FG/11qrHgE7sDjnLZTCqlO3l8ZHirCqwPtyBbV29wHC04gOPtLhxm0dj3iYDF7VX
 J3dmjhvAtjxDFwrW/bnSIvYq3AHKvwBrOj3kpzPK5vJ2jhNCa+0QCMyJrHXQH8yf
 4XV1I1a9AUnBQdh+P+TAfH3jkoUyuifYye5PtG2iHJCuyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0gen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:55:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d6a82099cfso36968651cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 14:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837355; x=1759442155;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4ka2QLj2dY6T1dJyHEA3YJ/IzOlBv0wCYfphXRfYzY=;
 b=ogiX0IbtllegYpelYgtOHU1GMQf/JDHm4UtH7SpTqmYH1S12AaqaNgoBS8niYIrPDF
 xeCAx/dbtUCDP8kNFFaYFMN4zfYhBWVHDT+eNjCkoGnal9lCN7HbH1L53NOpJQngm5b7
 V5uhdF3ABVfyl1pOLQILJgWsFdK+kduPK8TVu0+P+3tt9BDwKlQuEzx0pNXsS1j2Hp/t
 QHH6XI3NqeFypQf3kfg2afDkKKHE6X9Q5h4kMh7iBTPiHqXcBrQj7S+HoaC8fzKkQHeJ
 U2hd04/xYQSo5ol4jKzEsyLX//otN0E9CR5Hp/7p571u2kGOAlD3teko5kTMl2BG17eW
 AzGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSYivqDIwGzINMdUSmd1ocGG1i++zHmaV9ti1GkXghWMc+/F6bD4pPLllfEev5qzwPaXoLqwqQ7tQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXs5JbMWtp7lyyojp5BohG9xeE+YrPdwazoaFIKpfTNG8zyKRI
 yd1wy/4IJKxhuFJ/RSRoKXEyFe8f6HtR43GKHPGGzkrvqapYGCyP7uDYA+4F9krDfYWE0scMbPT
 dRNZU9RubRoBSsLX6Oi53N7ad8UKcWshQe2nzhNuOYw/HJE7OTa2W+C6CjufHRIbLe2ghD7U=
X-Gm-Gg: ASbGncuCwpJ12Z4AXTHktsC8bAQYgOpfB/DUE+6wpfnSfnvl5C+7fEmboPIsTfJksL1
 Ok33awjhaWs9U5WKq6Utex5mYIOjQ9PNd2q+pOaU8alAk6jUcmUmE81ZxCPFn74nW7roYXVda5p
 pko6h6tMNLxlVJVmhx1BQhPFErMsUdM9sVKVTWhtzGWsekgQSduqWNyC7oPxVkidawXUqFYfXBC
 cN1AP6SmmOrYXqwKhsvbIdfQDRr9SFHJrFnbKVaVtFd/ctHGHWXn1r9c+SRercmmWai3vUH1zt3
 fVBG8l3FUMGprdPOCcAkS8qo6oVUtSjVs0D+hov0zzWr2z5i+tIavhSc2si/NvifCrTL0EKTpix
 aoU7x0FwEt+kgxo4J5j0fZkzxVUKcv2SrwfR57HkCkBR0UlFucXkF
X-Received: by 2002:a05:622a:7717:b0:4dd:7572:2165 with SMTP id
 d75a77b69052e-4dd757228f7mr2467941cf.35.1758837355044; 
 Thu, 25 Sep 2025 14:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYntiu6xF3k5Ru1LTdNfPxLb5elSDEpGFN8h/DlxytsTv6aBQLG8p6laJbBjAkaRxRB3PDog==
X-Received: by 2002:a05:622a:7717:b0:4dd:7572:2165 with SMTP id
 d75a77b69052e-4dd757228f7mr2467661cf.35.1758837354550; 
 Thu, 25 Sep 2025 14:55:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5831665624esm1154346e87.69.2025.09.25.14.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:55:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:55:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v6 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
Message-ID: <af7y4m6pcaeavwyxmswkjwugya3na4r5uaq2hi7cevt4bu4573@3zzfjxpc6t62>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-10-419fe5963819@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-10-419fe5963819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VZZUYQHR5qZy0_jUEjTgWmizB7WhB-A_
X-Proofpoint-GUID: VZZUYQHR5qZy0_jUEjTgWmizB7WhB-A_
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d5ba6c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7a1U2GcbA96CJLvzQ6EA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3N7x7a81dISG
 Q7q6ydaekfDTs2us8+leztszHy0TejBb5iREkWMup+/N6puiTCpRCMpcVCrJ6AjrDDl/mObzmPI
 jFmfNsEKP6srb5Xeg+SAPecNjrwzc1GxfbDAu8dXo5vpMhfnOkEaKLFbjg85eIdEdBIBwEjxfVl
 0ZsddSNurz90Ke5dUGKxRkLuvpdcxd2f+xnliWMFHe1mgyQheMIQYWUueBgT3JSPmKS6QGtPNi3
 wzPXhTuTrZGcgtsd6CQCJ2NMrfc/USMOAq3TMl6RP5eUcZx+DNZ97RazdtvFRRkoYSHAK3VgmWZ
 R+gRU66ZX7ywQUJ6HPKvjZf9aOnotTqgh84ZP8nQX956u1hfDsHAd26rxQj8HFjnZ2Ok/4hZx39
 VGUV/F13QcB3Y9h0uFq77YzJCD7ESA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 03:04:56PM +0800, Xiangxu Yin wrote:
> When both USB and DP PHY modes are enabled simultaneously on the same
> QMP USBC PHY, it can lead to hardware misconfiguration and undefined
> behavior. This happens because the PHY resources are not designed to
> operate in both modes at the same time.
> 
> To prevent this, introduce a mutual exclusion check between USB and DP
> PHY modes.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
