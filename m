Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B398FCC5D2A
	for <lists+freedreno@lfdr.de>; Wed, 17 Dec 2025 03:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C895510EA3D;
	Wed, 17 Dec 2025 02:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyslCeIn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0YBhM2C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E563110EA10
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 02:49:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGMQpE4723902
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 02:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hSr0hfpjiunYgxMiBK9XcZqGRzRse0hnRDW3pHNLDAc=; b=NyslCeInX+Gjk0fM
 u6NoYEZ0FK8v8b8aKBhyYySZqKuOBwgZVv0Yba0c4lDb26EX7e08BhrXTiRPmC+S
 L+5WDCo+eaqR0vo4SP2ABO3z8tiv8Md4Xq/JVzitm3+N2msl9m4vQo7rd2aL/Buh
 gKY7aIU+/cKYS2xuim4nT8WoanoAYbXQSN7qHO1bNUbczIjMpNH8ZDh3KzaV2SPY
 qQ7tjmvIDgZaVDsnmjxWs0gsT9Q3niK4YSy56V7sDUFNWwvz/XkKKusYMI0T+Qac
 L3UmzdPrvE5DOl0btg9HVnxvtXD+KVgz3i2iX7QZD8V4yIP8IWpTaOfnLx7MyAdO
 R5HM8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fh18nsk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 02:49:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8ba026720eeso1045364985a.1
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 18:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765939797; x=1766544597;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hSr0hfpjiunYgxMiBK9XcZqGRzRse0hnRDW3pHNLDAc=;
 b=I0YBhM2Ca14T3HL6WQvlNW0gfUSycbsIM/TLkRqiqQK0Q5QG0IZs32vx4GEGn0ZcNb
 AaTakDZ1dFyG3qJqlzfy+0UzviCwnhF+ymfYvKQYyiRwrSC2yTGm/bRLiF5Kq27PZrrF
 N4yEu0+y2K0b8LTHKHpFm7r8xY57P808I9FyCkAIj1LDRYdfbj7NVixBcpaBp3tEsW4b
 FrqeIZIAWXqHBhS6xv8+QPLieYrSiYO8AqgXpUOC1cPPzJ1sr/MIEnx94Huz8CEdBDrR
 g8MRA9DrFb7ux1Edr3MkgSjo28jKDu7ZsSfezo0n9myzp0mStFVoet88QFweF/M/J/hC
 qxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765939797; x=1766544597;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hSr0hfpjiunYgxMiBK9XcZqGRzRse0hnRDW3pHNLDAc=;
 b=PPD8jMeK7KPaIYAy69BjD5QDYFEZ/Zn9hXHOVJQ7ZJDvNfrUA8qDqPB9cVYMkInq2H
 lUFokR2mJb5V2jaXqN323XIAk6qpJMhu2RZb3meDPUoake3iO7rWyprSxMiKd7OdJR/9
 mArXRce0dHvKNvt/CwzjmVwHEVeVSb0ZY18Xj5l5T4DJ5tLd1gvbUg+O8MQ9XoXE1eOF
 PNiOwETF8yq0nfARc4MielIojCQnGRWW5CqGjdEpkKGJZeLPTfSyHIAaw3rG1wEcaaXp
 HPx11467pQQ4g5NfFZVmdOl8KDjkxRkBOEU96Bp39aWBix7lKZH+oVJAfkXmpS9LjZio
 Mm7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq8qke1ob3jsdq+jqSWiLB0U1ccOs8k5HOYMX5KLHXVsyXqtJmBIe3UvDoK6GJZ1KR/pQR5u0VcHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCm7pF0hGWvLlKpawy3UsTO6sbV+hR9NKP+W8uQDGlSrTaEaVu
 p4c8jB3rRc7obfuqu1XfFTpLRU82jxEwfhZbPeEffHtgo3sVjgKlO22dwr4N98Ur6PFjmn6ht/N
 J3UmDAivzZZwaUNjUJv6BBgU+HJZpw+uEMTp4Oxb0RfjTeujwUrRd3DdhxJedX6Y65YaGeyE=
X-Gm-Gg: AY/fxX7uMoNt3lrTaBNbkL21sNBLv772lfhIIyRrk3ifS5m49l8CY0uDt4ZbCQKL4Yu
 72mjly1+afFbWoG2r151FsRtELpt2DDxbimIMo/GKtIBep52pGFERlQ3nIGQRtI1n9tD7Wuv1y0
 cidDiqzvpPE4VTIwK2SUZkFiZ+oTzygXJvKddn2rlDd9+iyQvJFOyGRRel0Fr3gpzen7NiHWZKi
 0tJT31yfKLAG6SctXlmCz2mrhk4+gqALtD36z7sbcohsdgjcE1r5G4U92Ndw9tLu85v+kSXCkiM
 hqs7IIXt/qm0MV2VNRAHwFzxFE7O3S+WkLYhKz7UNvPuH3W/LyoYQ577vR959ZThe0vKXRuD0m4
 YadCawY52GA+19I57S4Aso0Goqkdv1z1qKZ3NssY83HiduvXE+h5rBW1XDq5IOwwFCy4D+e4=
X-Received: by 2002:a05:620a:191b:b0:8b2:4383:b3d7 with SMTP id
 af79cd13be357-8bb3a39b8d8mr2263084085a.78.1765939796922; 
 Tue, 16 Dec 2025 18:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2V4Ak+bxZ+9N52X69IaSlBoRPk/4ZmPd66syl4awFyKNhqXPj5s78LJaDXi8BFnuENUUgfA==
X-Received: by 2002:a05:620a:191b:b0:8b2:4383:b3d7 with SMTP id
 af79cd13be357-8bb3a39b8d8mr2263079485a.78.1765939796376; 
 Tue, 16 Dec 2025 18:49:56 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8be30d8a158sm312944485a.21.2025.12.16.18.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 18:49:55 -0800 (PST)
Date: Wed, 17 Dec 2025 10:49:45 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: yongxing.mou@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 konrad.dybcio@oss.qualcomm.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 neil.armstrong@linaro.org, jesszhan0024@gmail.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, linux-arm-msm@vger.kernel.org,
 lumag@kernel.org, simona@ffwll.ch, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, abhinav.kumar@linux.dev, mripard@kernel.org
Subject: Re: [PATCH v3 04/11] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
Message-ID: <aUIaSVObQJCJH9Rf@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
 <176579137354.1486530.823295322686100207.robh@kernel.org>
 <aUEG3TL34CM2V5Z+@yuanjiey.ap.qualcomm.com>
 <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
X-Proofpoint-GUID: DNxeiEeSedxHnKPRGK69v9RVD4ngC8W2
X-Authority-Analysis: v=2.4 cv=CYoFJbrl c=1 sm=1 tr=0 ts=69421a56 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NpoKe9w8x2AnCwLKvqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAyMSBTYWx0ZWRfXzA0Ui2Ety3jI
 KVR0x1Bj4aAdiquswpJ511OESxRMCl0AyTw0SLxy8xiv6NpMvjux6plS1LztBaC6uhxQeHFIxnZ
 KytQDQQtqsPxfN09z0DCrLjGcgr3ybzZWSZ3TLlVbNjUg/tGpaCJaubrfvFpHQ2ohFNQwKrmn/o
 398SIjGFNSrM1alXs0hGFqdwjd1PPMf25yTPcnAojYdXlgQqORMJFi7++fNYQJI0b8N/g1nJENj
 afm5DCyBusawu48VHyv8Qy6jQ8WauMkiEgcfXuKDlBQQ2XyvwMrTceJjsBf8ck9fld4dmNIEqDq
 23ZUpaDKJxbuBKMY81xB0YRwcKmb71SNv4ZvJX7cqOYqqsrcqMnHfcNQwGcmRh+WxXfBwMPPVCe
 7RnnpaZJyuwZxcIRwrUrLPzDaTCu2g==
X-Proofpoint-ORIG-GUID: DNxeiEeSedxHnKPRGK69v9RVD4ngC8W2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170021
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

On Tue, Dec 16, 2025 at 07:11:19PM -0600, Rob Herring wrote:
> On Tue, Dec 16, 2025 at 1:14 AM yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >
> > On Mon, Dec 15, 2025 at 03:36:13AM -0600, Rob Herring (Arm) wrote:
> > >
> > > On Mon, 15 Dec 2025 16:38:47 +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >
> > > > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > > > Kaanapali has significant register changes, making it incompatible
> > > > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> > > >
> > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > >  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
> > > >  1 file changed, 297 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: phy@9ac1000 (qcom,kaanapali-dsi-phy-3nm): reg: [[0, 162271232], [0, 460], [0, 162271744], [0, 128], [0, 162272512], [0, 1024]] is too long
> > >       from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
> > >
> > > doc reference errors (make refcheckdocs):
> > >
> > > See https://patchwork.kernel.org/project/devicetree/patch/20251215083854.577-5-yuanjie.yang@oss.qualcomm.com
> > >
> > > The base for the series is generally the latest rc1. A different dependency
> > > should be noted in *this* patch.
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> >
> > pip3 install dtschema --upgrade
> >
> > After update package,
> > and use：  make dt_binding_check   I see the same issue.
> >
> > but use single check:
> > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> > I don't see any error/warning.
> 
> Because DT_SCHEMA_FILES excludes display/msm/dsi-phy-7nm.yaml. Soon
> (in the next linux-next tree), you can do:
> 
> make display/msm/qcom,kaanapali-mdss.yaml
> 
> Which will test the example in the specified schema against all schemas.
> 
Thanks for your tips, will fix in next patch.

Thanks,
Yuanjie

> Rob
