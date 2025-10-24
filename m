Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21771C04401
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 05:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A2910E9C4;
	Fri, 24 Oct 2025 03:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSkLe2wE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B98E10E9C4
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 03:28:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FfZq006904
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 03:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hZRKGHf5eiS7medbsEc1yTLg
 vLooHsK/MU89hBujSiA=; b=kSkLe2wEBX6htBZhmJddfIpPgH8+2BOgJcKUnTPn
 LA7b3rz7bThHoqr5R3H4BHfAnHL75uEabGJ7D7mR1QR+Ns3xXgWtrugaiV4V6gNF
 5KRbQ+cavGnM4Od0PZUl9GIBFuedmlbwW8DOJnE6jW0H7ugjPcZ1t6LgmM605il4
 qqhHDdV/3qZNooHaCR0TteVcp3JaVzPKYRaVEsCWVeqwGZSbX9LIlAXM098HszX5
 9tll+BVOkuhWRdEU7yFPdzRkhZJQNkdLk9Q1Ml1YAe/mddkZzUrBrfcBsx+ZlROm
 FAX7Ju381ZYHpsYyJOxhel9T4MY4IFug5XCl57pHafLXEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344apcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 03:28:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88f1dad9992so632127485a.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 20:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761276486; x=1761881286;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZRKGHf5eiS7medbsEc1yTLgvLooHsK/MU89hBujSiA=;
 b=iIt9MmKq93BypuJGgmjaiz9atdfShTNWeIUIWbkBS2ijuNxtF2rsjGB2jPeJoB1G4u
 x2DL56afHJNNJl6+kZIAK81Jx833gx1S/dcp6SMOJQkjXHBLg4mBUK0JvisOSTjbEXe6
 DmhSfy3oD5IfHMZxys1MCLZ1UGLoqtbHDFguqHp4PByq5R8l7xHawe0tJ/IBqtI8APzo
 zqmRf5xMCbSFmSkhcD4cM7sTocNbPFOMegAIwL/PtyA2LxzyD/Bq3RXCxtQFZUg+jJPk
 HdMhcVlbN04W05hmOFvhkRB5LfEIWEomcnnlOcuxWRXCpFa55ECPat5JFIecHFAP07Qc
 9Jwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH2ChvQWLXpEh8uQ1NIwc/HekCkDbQrfiBg0oqTPqQqgH2NTNYJIQNwSisXj6XOO4/5iD5FjZutns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/z4TRXXK46PIF2Ggi+na3pKL9jsQsFsUD9Janee1u/Bg03IyJ
 iXgkwgtYeU3NRaRs9syjgZPek9HLOp+btyKaQFJiCOAraIiEt8pW9/WhtI062LhvjoTxhyGB9S2
 f9pmng6fHwOTnUNhgM3TM3y9RKEej8CE+sMeKk2eopvJ6ABGS8jXydtAf+A1ReMmImzfr+gM=
X-Gm-Gg: ASbGnctTGwvdeaDGgmgsmM08CgD39vpgrU+x6PYtnlHapNf32SR/+67IE+XaKcIvQPj
 qwpUSW85dQVKmFfXea0NWY52sDLf2PzTTBrT1e5f8ZuqZd2o3JEWlHNSzSLT/nva5uPZxhHurv7
 xo/v9JBhhJF7j2et0FhdFHVtq7ZoQk2tHmj2rfw6b7lag/iOJHdudgMwUbExKVCH74YBKUC+8Ti
 ycZIrP4/v4KZcJvyFuUrgL1uymSFB3RqYKwQzeUw3W1OmYqHQ2Q9xKFSLstBXhV0rOZwjIScVTI
 yKHGSP2+FPJMiL8yhwRFVpWV7p7w6zB3GFTd1GtAWufIxuJ1imMKt1D5IfUZbAxgb7RDGKVFYY2
 fuDH9h7wvtwMvZHCF1ragh9KBgKO5M5wUOf9jVMHuMa/MGKsxbXLk9KE/ldnx
X-Received: by 2002:a05:620a:6884:b0:868:1899:b3c4 with SMTP id
 af79cd13be357-89070115826mr3155293885a.48.1761276486150; 
 Thu, 23 Oct 2025 20:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnIyfQMj4mmjccKB+vbnKu6/RWvsqjZb5kPuk+y1TdkZQGLJl3cVSm65rC7YNEyAuhfj8+ig==
X-Received: by 2002:a05:620a:6884:b0:868:1899:b3c4 with SMTP id
 af79cd13be357-89070115826mr3155290385a.48.1761276485620; 
 Thu, 23 Oct 2025 20:28:05 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c1169a47esm299748285a.37.2025.10.23.20.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 20:28:05 -0700 (PDT)
Date: Fri, 24 Oct 2025 11:27:53 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
X-Proofpoint-GUID: mqKUHoh0RRg6MdLCQxEt-bu50frF8IKq
X-Proofpoint-ORIG-GUID: mqKUHoh0RRg6MdLCQxEt-bu50frF8IKq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX7TtTAkuPQwP7
 f2v7JSa7XqS6pUOqoW06426S+jWBVCclS49ItUj+bTEcIpC5vEbslLrFgtzeHkwA9SZ6R0xqU3N
 W1XEq1UbB2qKYFSvwlGb6GIQ+6K75dBV8QB+CUfoPE2WMStlIje0ptezDL9hkyJAaplk7eqN6z9
 vvdnaWBXnZP98ccQPPEiGjwiF0vyDgGDFUifr+9ly5rDJgv297a4CuvGwIuH+qJucUkw6qy6cQJ
 YFOW0zZeGWZnTon/v6ZS64lVTxghEAlpCaR+2Y+HIR1sJfrUNm+P+eYxlSmTOpIVQgwoaZdbeQj
 fTd6wXBJGtry3v/9Cg+lzCktcin6DWVEYJWYZk8H6g0ngLnt4FCO5P2mLD3Kt0MS7dzUZGmrtLB
 gEbzoDUXjFPXsQmZnhrciQsqb+E4PA==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68faf247 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w-wrxfCwE3y99oquOGQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
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

On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> >> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> Add DSI PHY support for the Kaanapali platform.
> >>
> >> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> >> +	.io_start = { 0x9ac1000, 0xae97000 },
> > 
> > These two addresses are very strange. Would you care to explain? Other
> > than that there is no difference from SM8750 entry.
> 
> They're correct.
> Although they correspond to DSI_0 and DSI_2..
> 
> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> new features. Please provide some more context and how that impacts
> the hw description.

Thanks for your reminder.

Correct here:
io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1

And v2.10.0 no clearly meaningful changes compared to v2.9.0.
just some register address change.

Thanks,
Yuanjie
 
> Konrad
