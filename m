Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2771FBD2FF2
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 14:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02C010E2A5;
	Mon, 13 Oct 2025 12:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXcT0qSB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B81D10E32E
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DB20I5030097
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gObp1VGk4sT3wo0aNUTQnaxb
 hlPxOaJ9VK/6dcghZLQ=; b=TXcT0qSBuY5yfp/PNTnIrw7XNb+s9/QYCReqou30
 gtIGh5w1O98le1QLr/UGIlqf0FRAMWKyhoiDDhQq/h5jYDxRoxHhe6PFGxmTGO4+
 iKvu+DfCH4bBE45FfhsCs0Kr6YXrVVfvxA52xvansO5wQ7lI0sOFFKbBRHrR6CF0
 h8H2/uLaBv/6+Iq89Xp4/B79JK/GTDI0ThFUGtYMDBywKpLJu8svaMWw/lmLFzZu
 R+K8n4dJuanKaKDQH7sH9oCVV5sXmIT25qvxdKQhxYsCoq+ieJP5tDS+KCFNMaG+
 OCfDv0LxPObPXHhVyDS8uCiV5xNtoVyaJw4sHJ0TQhqPDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0mgmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8589058c6d1so963741085a.3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 05:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358893; x=1760963693;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gObp1VGk4sT3wo0aNUTQnaxbhlPxOaJ9VK/6dcghZLQ=;
 b=e+uyj151Oc4QcFaGPhfhtxjiRw/lopa0Bs1twqABUlEmO2pQAF3ioPhKAIsonJADUW
 MF/AFFgDCZvXDGbM72/jyqhXEzV5iM860ZlTIuuvzL6iaWm2vomCGAOen6VHIq4z5Jke
 zAoi8/JZYAK2Vde/uTwpGFNBU+gcoxWxvtjHkwbzitcJhq0c8KAcJcwBPviO8uR307UZ
 XL50UDfXx65kvD7KsW0bzO8htK+5hPcyLC+9Q85NYkjTxk01iZYOAl+RYBmYymFYBE0q
 GTOhgrXOHp9pPB97yTWyHOuXpKyc/8O2SpQG+Wjajtpf0Wx/X4Pm0/PmIvZ1ggXFLgEZ
 Lc1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Pl7g9ONhu+KsvdCR8XQvxC1ivAn6I/KmtyfIPpqyXjCJ9HHfnjyGV3SvetihWFjnJEr4S8bfMg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOqawuhhHjJ/7AExNVDC5mzknIjrEdnNT0dhCbv+FsAgi0jaFZ
 /wxgniSfj9iHK1/2b1E2CDXBHgm10ZQvL7d0nqHKJRBrSX6iRCJ2tzfj4a9QJtBY7lnxC2Gg+ry
 2Zd46BTTEv+gUVG5UnrlHR7Ny57eLi/Uc9zuGxF73qTVVHcEfcKTpS60IZCxBAUbUL+2zhAQ=
X-Gm-Gg: ASbGncsehshm7laSMem9QLcZWQwhBN1o1pQoV7cRHQ+S937ZK3eWleGkHNFhqUUeqfi
 ms3FM+3pSEIsR+Fy4uKSZekkEvHDB/s2YEu08EXKcFuaKVvYaJ+q/SCshIFjJdtHFgeEo02E+0/
 NRsi3jMbZer0RRg3MH1DHhrqlt+V0aS1xnRaBUfwmuc2GFCpnmn+/4jeOLHnvErj5JF1ijaapM5
 7tzqjDCKoX8vwPJrC/ggREU2ISQeZ0UQ4TZcZK1z3f4RDjwSk97dM50v8B6IpDnPV1w96HrsT+b
 2VBMtlGa3tZ5/0SpZUTLLV3sPDN6ioFKpsYvcoTWOQuWoTx/r1RirtmEy6nDxEXfMtxQJzY2z/Y
 WbPGcjFu8bgNUdD93PIg9p7o7eoeFni1SBAIr8crODMDp8RCYdAJ7
X-Received: by 2002:ac8:5885:0:b0:4b7:9581:a211 with SMTP id
 d75a77b69052e-4e6eace7e6cmr280427831cf.24.1760358893336; 
 Mon, 13 Oct 2025 05:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5+lAIUbag3KQ/uyAYMUw2tzUdGLO9/5D5HdSvdyoQpY7sOU2YLiAsMhiWrQQX23CCsWeehA==
X-Received: by 2002:ac8:5885:0:b0:4b7:9581:a211 with SMTP id
 d75a77b69052e-4e6eace7e6cmr280427561cf.24.1760358892867; 
 Mon, 13 Oct 2025 05:34:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088563b53sm4075703e87.84.2025.10.13.05.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:34:52 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:34:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Message-ID: <aifibm7pjva3rkb4gkzyxun46sraxyeh7jh6vgcirv5tsbf6ad@7f5bbs4ix7sa>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-2-quic_riteshk@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwVr9Vu4ZIAVm
 nXKEnSLfVmbITTtkBp9DZAHDusjeGz6d6hi1gNbu9eyRl2beTHRn2Zq3m3yQbsV5vZUNVcwlyWw
 ZcraUPpAUjajCwB+YEIIQ0x6MOUCLv5VrnXBoua6Ytb0DB/yA6R/zwcOgaxt5hsjFN0V1g16VFY
 UoTq9eeAf1MyhVIG0fRzOpSyAstbxgGDonL4IWtG2dk2bVUBSRdAammIZ3FdtS+O8rS6d7wMRfX
 Eo+heAKhxk0Ak70aBy5+WzKsAzDPsSN7VI4A+jW2rDW0OAe4j04Q8IKe3eUUHNPs8MXFCRM0v03
 QxoMwgkA06nuPZlGnP+Z6DYmuRhpVOO6ql4aYM+dQ5jJ2PZJySAI2pNwzeC14CUPFieFBfVN6jk
 WrZOkHc0cii1KuDepwf7ED2JKCSohg==
X-Proofpoint-GUID: tqvhozmFJijE6lBIjywt68bGW1vqJihT
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ecf1ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=yLsOkrEfH68IAt7CJG4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tqvhozmFJijE6lBIjywt68bGW1vqJihT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for sa8775p edp phy.
> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index bfc4d75f50ff..b0e4015596de 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -73,6 +73,7 @@ allOf:
>          compatible:
>            enum:
>              - qcom,x1e80100-dp-phy
> +            - qcom,sa8775p-edp-phy

Usually such lists are sorted.

>      then:
>        properties:
>          clocks:
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
