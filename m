Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A69AC3063
	for <lists+freedreno@lfdr.de>; Sat, 24 May 2025 18:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150C910E0E5;
	Sat, 24 May 2025 16:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiHZ9HNV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D8210E109
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 16:06:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OCZHC2003801
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 16:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qvWre4NwLlEhheV6UhBdS9zth/I+k8wEV1eM6J753YQ=; b=YiHZ9HNVNtH2gNwj
 7WHHK0+apf+0Cv5/v/qmyCUN9D+064lld3QxPE+Vwa9CQJuMA/BuTVpWk2+zYm2T
 HnD5pBh+zjGNoP0+roqajSH6MavQ7foATxv/NO/n23QsXAR82cNrrGADNZROVztX
 XNg2DlY9JxD7phtbjJvIyA2FnVN4EecmdvIzC+cEGOxIvOB0jsIGjnrX+Ejg0KZw
 u1/FeogRIr8p2j9shvPtcM1g9637N5/IIadz6nRtGhu/gaE1DVcinUD32PDEYBxm
 3AMRU1Wmuiik5VWibR25IHW1SIOlgMFwEqUIpeb9f3S8cnOErmNwoxutD2QsUiq/
 eEp2dw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjgth5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 16:06:20 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-708b13627abso14839587b3.2
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 09:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748102779; x=1748707579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvWre4NwLlEhheV6UhBdS9zth/I+k8wEV1eM6J753YQ=;
 b=BCKiTAiHymVfIPq9MILRZBhL5awbC8073jUUyCFWyz6+An5NqvFYSjhGxThbRdrgmP
 WR4at/7LCn09wHA2zvN8Sjztd5PAdBlNtACzwAbtJu3lJnGDvgu7EU3Jfngx2KNJ/dOg
 wqlPef7hAOW4nCaS6lXpQv9PoakslGwS7IFfXSjpvES6ngVMyN40Sg4ntKkrd5R+U/Sy
 QfPcA3M/XpD/1PdCZ6MsHrfCuecRe5lIClvrFOaHcJeahRlbAwEkJFFAIsf80z3YbG6F
 Q1lFVG+xNIUBKy04+yaqC5ups2BHGpjjsd+MysnUiN+SIH9CQW2/RawoCnS3K9cr6LCw
 jT/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5wtl7NlYOnjSkMGoZe7BvP6cLbOu3mO/Z2rOzVWkPfMNJ9VVJPlu3T6bG+LY71VLzF9SgyyVErWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXl8Bn8ZKIZUiR5A4j/iMMeVUEdRJyX9nckwjVnjU3OItVzd8Z
 BOpmdJvXI2nK0KPcrcJvnR80YL+C42o28qrAIlOcsUQlXoed+iK+ou+JggmSrRjqYELhrSkBYQT
 rDLARn55eo4J0PjRadtasJnVduIryCYnK6z1KF1KMX7VttOuzjaoBWOxRC7Nik1SVnkSN9nG6wl
 /2IXlwv5VPH0iO1Dvm3KqFPwTtqEDR4aZkAyyyyXLOfo461g==
X-Gm-Gg: ASbGncu1r4CzbRb9fkL+82cEqhv8rm7s+RpuxCS9rs9TWGM1U2UtsT7QM8td8lDpDDA
 7LBor1zlyI/0zACuE8CKEmT7+wfd09OS/sIrBRbl0BYf7IrTm8jS8lUhYnc9VYHlIx31PPcI=
X-Received: by 2002:a05:690c:6710:b0:70d:f53d:dd34 with SMTP id
 00721157ae682-70e2d9d50c6mr27825877b3.20.1748102779173; 
 Sat, 24 May 2025 09:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4tL39voPqdTiKIP3IIIX1ysehsTY0iOqhgM4UabaxxGpMrBca877TkCTIF4JkmyrzRULHgkdJPd2B9DdtaSI=
X-Received: by 2002:a05:690c:6710:b0:70d:f53d:dd34 with SMTP id
 00721157ae682-70e2d9d50c6mr27825507b3.20.1748102778853; Sat, 24 May 2025
 09:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
 <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
In-Reply-To: <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Sat, 24 May 2025 21:36:08 +0530
X-Gm-Features: AX0GCFtYDaH1Ic7QEuPAQQ8ozFwzgT7xoanbWmVWsm-9FahKFxoR6k6aeF5-CQ0
Message-ID: <CAHyS93o+zgBK=zP6N9O+qvKDgPTe+OWtpp70D5ciYUfQyqAf7Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: msm: registers: improve reproducibility
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6831ee7c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=DbLYaGFL_cwN43_H1DIA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: Ja4iBxZZI4WgqIwolcOFBm8uTTcv54yD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE0NyBTYWx0ZWRfX+yYns/OuVUj4
 xu/Tpfqp6O4BHlnaWfGSrctTQcix9mEtkEfGk7tV34GgoTd8c7ETv1hl3XBYaUQaa7JmCBSYFCE
 +4R6FAEMo8nUBwhiYIripKGQgFfT3jPtb+z86sNMoIOVLnFmGtre5lWTlanhexaLfJE8RZnTRkJ
 iI5jQOmyAijGT96fIveQ+LW+Pq3fnW5sUqpq+0FA4EsDd/wH90YFp8mI4k+G62VbE+2MO13gn1W
 sXAxudScgpnRd/WLaHCYyzWDD9IuNZAe1B6EDVYa17tJuUCoTkx4r+hpghIJ7XSh39395JK0Kx5
 XZvJlFTB31uZNS3tCVwEQIbbrZExfsM6OjGa20ZZK+8mxQIJ+qjtbp6OGGILQAf5SubOtOwy4Vj
 VpfO1vGw+u0PevjZgYEX04gHVG6yJyuqHqrEqqY29D7Dz8HdB1SHrmSGLjgrONoJxHG9hmvI
X-Proofpoint-GUID: Ja4iBxZZI4WgqIwolcOFBm8uTTcv54yD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=424 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240147
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

On Fri, May 23, 2025 at 10:30=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, May 23, 2025 at 06:36:16PM +0530, Viswanath Kraleti wrote:
> > The files generated by gen_header.py capture the source path to the
> > input files and the date.  While that can be informative, it varies
>
> You are not the author of this patch. Why did you drop authorshop
> information when picking it up and resending?
>
Apologies for the oversight. I've corrected the author ID in the v2 posting=
.
> > based on where and when the kernel was built as the full path is
> > captured.
> >
> > Since all of the files that this tool is run on is under the drivers
> > directory, this modifies the application to strip all of the path befor=
e
> > drivers.  Additionally it prints <stripped> instead of the date.
> >
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
>
> --
> With best wishes
> Dmitry
