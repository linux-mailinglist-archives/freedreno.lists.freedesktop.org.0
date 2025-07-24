Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED04B111D8
	for <lists+freedreno@lfdr.de>; Thu, 24 Jul 2025 21:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD1910E29D;
	Thu, 24 Jul 2025 19:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9JillTe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E2F10E29E
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 19:41:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OIjlbE023211
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wwNM3mtjau7uqQilaPmYdY7ZPk417VPjIHda79n7D24=; b=f9JillTeN1WWZHH5
 ZY3pIKR7gBlgsbTV8nCfFkTwKQFvc5kAKHYZv2Tuj8F0FDRD9jScKpxAp/K2jnaB
 euatl+Z9Tsi99VFiPUFZdOBnCGc0I3d3Jx8BF33TP7IxPwSyl722y8Z3ZgTaIgfH
 Bvt/53/FSMaoTtatXZAU9N5bKFUAa9xDFVCbyz1RzCKGaz263feye4ADoqGNI6w9
 NaFOJuXW3mu1PVZ9howbmHPYzAbpkvSRfFgJrxlQt78K0uKPrjADeNIv3eokqoAv
 CeQRDXO50Jw6HStpgErl+H0NVJCIiz+OAQYbMO6T3mZ/7BBEkwIOGDQ0EO+F2g/b
 WhrZVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kmm1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 19:41:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e34399a08fso328550885a.1
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 12:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753386095; x=1753990895;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wwNM3mtjau7uqQilaPmYdY7ZPk417VPjIHda79n7D24=;
 b=GWiYq34uRHQf0kmoRqEp1Mq25p1FPCanPusMrM+83ZyQpT/RfDPqnjVbVaqxqHDss4
 c7+1Ra7TLPc1RJGIF6CdTRf+7QVC1R+Bd9d9I4DnaSpp9HHPxLAdSm9mIei8I401b8MO
 cdxFoCS5UQt+M+vuq3Z46SP56fie66jADoPJkMOQRi0Yb37s4fZ4JfUH+1Tu0EJ2N9EW
 bw/ouTnN/m1wYLPO/0B4VktACZbNtVWFSDiRGQEIqTR/eW3FbnsHVvpAYdhPFWQQyK04
 nl00F6qX7OwElB4eP+VF77Tvz7bTVmarsXyYD82Yuk8gfgDo9HBS6lmxy1B6qh5ZZ8pZ
 r1mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE4AkICJGsStAmaaEBD/4vgzhO6HV7AKVXD8JIWAOKsErJjKj30M/l2JlKKGDtdoLsae09n3UxiwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9rFtFoItbsOMrbCCDQLIBguH4LpC4lEKhYm7M4ujmpACe8Gqb
 zEsAmKJrGJnTYZt8SL9C97RER3W2OrSJvlt5+4CP0fRvR7xV6RgL6L6F6HCcjvwgzTfJlAOSZP7
 Y9MzCbS5onOuqLVSHuaCqPHKn4bt95khkOBNfFx7l/Ez8RVsIZD5tHjfGmCe2XIeIID52V5E=
X-Gm-Gg: ASbGncvuiZrq2KzR1/zpaSADSU8vFtg6CoMtVzLo6WXig3AcR0ybDnK/hJCBi9VJQbq
 MYcYxT/cSvZEJyri4ea52YGZb0I15MhkajyL35R9i+g/7o8mHmdWyGzBAbMgN+Gaf/WJ91RK9EX
 Ad/vXgsf/IAyWLdWjCwMiIEM9TE93hGn4I0846/CfIlEYJKosh4ktjIH9uIuE6dq5dJ7dAOj/wt
 4W7nO/VShF9peU7UWkSLtBQDSq0RlxAfAgKzyVKbizTYqt468c0fu7qdhq3wWWYn6LtKdfPCTMr
 mOYItkM/sM/Bfc4B3oBRj4NUjNvxa8OVSiDCB2Ik7n40Nom+vpglw9LtIaPWQREXpq3s/XPOPzv
 tvo2zRU/u4eXENYOiWD3uTr4Jf9NJrxQctX94R0umb2Xbvj0cjMIw
X-Received: by 2002:a05:6214:2508:b0:706:6967:71da with SMTP id
 6a1803df08f44-7070069c664mr109753466d6.38.1753386095128; 
 Thu, 24 Jul 2025 12:41:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQDqKstosSneJZpb85nOhQ+2TXw7qj/NhXKc7lo8KhtjTczwG5CeYfAMo04mula3VPY10+OA==
X-Received: by 2002:a05:6214:2508:b0:706:6967:71da with SMTP id
 6a1803df08f44-7070069c664mr109752856d6.38.1753386094418; 
 Thu, 24 Jul 2025 12:41:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b53c87a88sm501393e87.152.2025.07.24.12.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 12:41:33 -0700 (PDT)
Date: Thu, 24 Jul 2025 22:41:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 01/14] soc: qcom: Add UBWC config provider
Message-ID: <jfslenwbfdoy7qz44on5ckzuljrxfjce2encitxiz5pws2iecl@2xnwdlpppmsk>
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
 <20250626-topic-ubwc_central-v6-1-c94fa9d12040@oss.qualcomm.com>
 <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE1MyBTYWx0ZWRfX10OXch5v3Jci
 P3n+JNBQDIVzJxn9LpJ9UA10PLRGyOyf0iGIgmm/JsI90NYwetXeLjLnkxyZEc37xUapXeDBnkc
 ARBHaFS8JwxGb04iPJUW2kvT3tTcEIgwq0P+fCHAFKZN1ceEBGCunfiQ6PmhyArVqI1FKPJ3pz6
 C8MPE3p4ZW/5IJHDGseJW40kza9sgjvBbe9nLe8Zr/pEAs/DJ2WDNG0ptwStTZSSjvoz9dtUIhZ
 Aic0ATHrierfEVuNzxVP3l/nx5ehVpnunAQ2y202aLNv2u6mite9LIIaJ5PB/tpv+2iSuO+PMru
 UWtL1piVhY5pQkb6QlQDS29IvNa6p6tgWbVcePDvSAXhvwX2gjgz3t7sHgcOHxJ4sjCQNmDD+E9
 ETPDqUAGzxVPJinvnzT8ZWw6Mc3OPzUT9ku93LPEV/TrZlHpA7e4IO0+dC02WzUhTejKfISJ
X-Proofpoint-ORIG-GUID: Arme0yF1xhK32MY4y999ohwKFudlH8bs
X-Proofpoint-GUID: Arme0yF1xhK32MY4y999ohwKFudlH8bs
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=68828c70 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xQNkBhgbifyRU6rVYtUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240153
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

On Thu, Jul 24, 2025 at 12:24:29PM -0500, Rob Herring wrote:
> On Thu, Jun 26, 2025 at 4:02 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
> >
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > Add a file that will serve as a single source of truth for UBWC
> > configuration data for various multimedia blocks.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/Kconfig       |   8 ++
> >  drivers/soc/qcom/Makefile      |   1 +
> >  drivers/soc/qcom/ubwc_config.c | 251 +++++++++++++++++++++++++++++++++++++++++
> >  include/linux/soc/qcom/ubwc.h  |  65 +++++++++++
> >  4 files changed, 325 insertions(+)
> 
> > +static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
> > +       { .compatible = "qcom,apq8096", .data = &msm8998_data },
> > +       { .compatible = "qcom,msm8917", .data = &msm8937_data },
> > +       { .compatible = "qcom,msm8937", .data = &msm8937_data },
> 
> This compatible is not documented.

Oh, fun. We have several qcom,msm8937-foo compatibles, we have support
for display on MSM8937, but not the main platform compatible.

-- 
With best wishes
Dmitry
