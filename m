Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97313B19AE7
	for <lists+freedreno@lfdr.de>; Mon,  4 Aug 2025 06:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E3310E2A9;
	Mon,  4 Aug 2025 04:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyIkqGCf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A393A10E2B4
 for <freedreno@lists.freedesktop.org>; Mon,  4 Aug 2025 04:52:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573MX3AU029726
 for <freedreno@lists.freedesktop.org>; Mon, 4 Aug 2025 04:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/cFrwLq3HQhmTSQxSXVw+WLa
 sVwzOCkOdDsAcXyYKYs=; b=dyIkqGCfdNKl6Us3ZqdLv900sBhQcbcZuKh3IpRB
 rp+GprCgw/PDncnzSI5o5u36Bd6Z4QlQlQDzaJlpXOInn1//ZY8MbDwuILRqGP7p
 xoUNT0po7g//5y7GL4+9vAD24pGMLBjeLq7RZVzbTaVaB2IithipY5ytodYPClC4
 dNUA7PkVaqoCvIW0ONhx9pL+00tl3h6v7izoJNKJpbJUKvcsDqBYp/ipOeViRqZN
 es5qUBMkj/VNPb/iOZd+sj0zhbDAeC168B35co6yR3Zi183lHCoAFSPvVHT8NcF6
 pdpCNo+qn5vdQC7vhjhsyaCOAP9EdM7ekV/EwiIrfWHlaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489arwkgps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 04 Aug 2025 04:52:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e1b84c9a3dso418754785a.2
 for <freedreno@lists.freedesktop.org>; Sun, 03 Aug 2025 21:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754283154; x=1754887954;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/cFrwLq3HQhmTSQxSXVw+WLasVwzOCkOdDsAcXyYKYs=;
 b=hTohOn37ps7CFQEplOutM+4NxnZHnFGehQRc9SpNvlbimkJYQ/n5Qw3V6GJe4pDtVm
 IwaPVjwtbrfhFY1KnHBaJarP98TnvsTrofUdHen6OrHttbjIzk2W75Eh18ApMBscEr8B
 wvfGUjbJbIfbgYUZ/Nol+PIG0uZhDVH4wwSbb5u6YV4ym1Bhs+5ip/1eHQFvfTr/h7iQ
 SqSlOyE69gKyBCp2MvqRIAv56I2y/WZGR9qegFezcO09ltLS3s3e3cK+qdIBIqkniOeI
 GaXqgGNyl1eGtlWFuIFAffDeFyZrJoLTrCHln9jbGvQLbnacvfOj7cz5yRfwfqvyF4QN
 6PEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7FBuCxwCs8MXM5gVtWzlm/g+1pANpOalk7mARhZZPJ56gGgyP0nZArXOvCjSpIkwXlRf1g/bU7ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlAMWgyjbi5UhM+/IM8V+u8OJWUtXcaTYCuuJfQEy3269XuTND
 dZosoDtNVTtznFKwHv+ty7XijhPo/R8Kjok4FUHq7OEANMpVVvG/Q/FOd/CvS3me3GyO8ymrqsj
 XFUEzmiMUZCUeHG6Hcldt/YWUUgO/ec6DQK/ZXqKf2bQViDylEcPeXO63gduoQuhuq4yHwqQ=
X-Gm-Gg: ASbGnctk/uei2H8N0inZCiSkvjBeG0tsJEtDxdQJ5Ovi3WhKnFbJO8vmFcTIgq2sv7f
 XNl8OMLLdi+JDcs9gT0gxp+NG+4nl18WrOzcZHa0mo4AzOGLmz7j2zDOkIdLvLUNQQO3RuFfuky
 tNtUws+nYpqbGT57VHB6arBt8V3OvIkLVdH4shm/Q+yy6tuBwD1XgPfZIQYSc+wGdB1uEnbxbnp
 2aBG3JCzISmGtfYn5rbAmxwJULBbTzY4Z45aeS5aIJ6WDas6GSFqccG83IK4WQIuyCcQbrAEJH0
 kgpley5Dd77Vj9FXTuoiRt0ntDvljtlazlDobztGyt2R0vsk0gk+Q1kF88n5lPrLdXEAXTPElmP
 5bJPdL+olcLMHIDabeQv55zmsmP7CWiA/YUvOV7cVNJhQipy30/4o
X-Received: by 2002:a05:620a:11a6:b0:7e6:2882:f25a with SMTP id
 af79cd13be357-7e6963a7457mr933657085a.50.1754283153635; 
 Sun, 03 Aug 2025 21:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMfTWsXHPhBqobpYEbz/9bATgsYAMJPvLrtT34rSptfkECCIJS6a5FJfM+Zfa+aRLsRdRtKw==
X-Received: by 2002:a05:620a:11a6:b0:7e6:2882:f25a with SMTP id
 af79cd13be357-7e6963a7457mr933655785a.50.1754283153198; 
 Sun, 03 Aug 2025 21:52:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898c164sm1468453e87.23.2025.08.03.21.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 21:52:31 -0700 (PDT)
Date: Mon, 4 Aug 2025 07:52:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <gkcy5rmtodvkgcyzv5mylq4fnlampwichvywcej7ncrbn35jni@ewvcda4o2s2l>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
 <deefg7w3ot6cd3woexfwagetmkg4nvu37f66h4ulbdqegdgi3u@plj6puxcsil4>
 <477bebcc-2d1a-4183-8e3d-d792e876c63a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <477bebcc-2d1a-4183-8e3d-d792e876c63a@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMyBTYWx0ZWRfX6h5qbx+bSXPG
 AuelrwEYAYnsLZ29vpMA4W2lY6wYzcYsCHjEWCbEuKHc1Dr7wvxQaze0GsMSo7Q1/2KF2GKtsjr
 ZKxEEpEpx8Ibm125adn8VdiTHcJPL3VvacO2cRc8aWqupHqXKtWgv81+V7+ebHJYK74UOYZZgvZ
 mZHZSvpV4coQTYJ06KvtDWuGUXfHA2fBB+fUye17QVLH5ovESzkvntaSL+aD6ybokBuTFuNDc/t
 HDrh5bd75uo7+hFO9oJswmtcYuj0uWqKmCY5NeBbz+/JC1ahZrqj5akWnk05w5w4N58MDA9jWf1
 Wvi3USmPS0ExJ93qGYEDquf+PD7r8so/ZfpXxQ7Tx3+4g/bl/WPBay0sNWQTn3PNssb+nLH8vFR
 oHwGJ6bZKsR0tzeNWk309NGiqoRpnoLcuPpW4mZBtun99qdzaLGIdfsEHLwErLWm8YGmGLdg
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=68903c92 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=Ynuxa8Nitr_4Jzo9iNAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JDXZacIyQ341KiLr_gZNvIU7jrtYV_Y3
X-Proofpoint-ORIG-GUID: JDXZacIyQ341KiLr_gZNvIU7jrtYV_Y3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040023
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

On Mon, Aug 04, 2025 at 12:31:31PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/8/2 17:56, Dmitry Baryshkov wrote:
> > On Wed, Jul 30, 2025 at 05:42:28PM +0800, Yongxing Mou wrote:
> > > Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
> > >   1 file changed, 284 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..ae4bc16395326bffd6c9eff92778d9f207209526
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> > > @@ -0,0 +1,284 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/msm/qcom,qcs8300-mdss.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies, Inc. QCS8300 Display MDSS
> > > +
> > > +maintainers:
> > > +  - Yongxing Mou <quic_yongmou@quicinc.com>
> > > +
> > > +description:
> > > +  QCS8300 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> > > +  DPU display controller, DP interfaces and EDP etc.
> > > +
> > > +$ref: /schemas/display/msm/mdss-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,qcs8300-mdss
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Display AHB
> > > +      - description: Display hf AXI
> > > +      - description: Display core
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > > +  interconnects:
> > > +    maxItems: 3
> > > +
> > > +  interconnect-names:
> > > +    maxItems: 3
> > > +
> > > +patternProperties:
> > > +  "^display-controller@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +          - const: qcom,qcs8300-dpu
> > > +          - const: qcom,sa8775p-dpu
> > 
> > Use contains: instead of listing both of them
> > 
> Got it, thanks~ here we want to fallback qcs8300 to sa8775p.
> Should we update it to :
> +        contains:
> +          enum:
> +            - qcom,qcs8300-dpu
> +            - qcom,sa8775p-dpu
> 
>  above method can be validated using dt_binding_check.


_instead_ of listing both of them

So:

  contains:
    const: qcom,qcs8300-dpu

> > > +
> > > +  "^displayport-controller@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +          - const: qcom,qcs8300-dp
> > > +
> > > +  "^phy@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +          - const: qcom,qcs8300-edp-phy
> > > +          - const: qcom,sa8775p-edp-phy
> > 
> > Use contains: instead of listing both of them
> > 
> Same as above
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > > +unevaluatedProperties: false
> > > +
> > 
> 

-- 
With best wishes
Dmitry
